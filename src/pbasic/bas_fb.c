
#include "bas.h"

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <fb.h>

#include <tjpgd.h>


/* User defined device identifier for JPEG decompression*/
typedef struct {
	int fh;		/* File handle */
	BYTE *fbuf;	/* Pointer to the frame buffer for output function */
	UINT wfbuf;	/* Width of the frame buffer [pix] */
} IODEV;


static const struct colormap {
	int value;
	char *name;
} colormap[] = {
	{ 0x000000, "black" },
	{ 0x000080, "navy" },
	{ 0x0000ff, "blue" },
	{ 0x008000, "green" },
	{ 0x008080, "teal" },
	{ 0x00ff00, "lime" },
	{ 0x00ffff, "cyan" },
	{ 0x404040, "gray25" },
	{ 0x4b0082, "indigo" },
	{ 0x800000, "maroon" },
	{ 0x800080, "purple" },
	{ 0x808000, "olive" },
	{ 0x808080, "gray" },
	{ 0x808080, "gray50" },
	{ 0x842222, "brown" },	/* a52a2a maps to red with 8-bit PAL pallete */
	{ 0xc0c0c0, "gray75" },
	{ 0xee82ee, "violet" },
	{ 0xf0e68c, "khaki" },
	{ 0xff0000, "red" },
	{ 0xff00ff, "magenta" },
	{ 0xffa500, "orange" },
	{ 0xffc0cb, "pink" },
	{ 0xffff00, "yellow" },
	{ 0xffffff, "white" },
	{ -1, NULL },
};

static int last_x;
static int last_y;
static int fgcolor;
static int bgcolor;
static int fb_mode = 3;


void
setup_fb(void)
{

	/* Turn off video framebuffer */
	fb_set_mode(3);
}


int
vidmode(void)
{
	int mode;

	mode = evalint();
	check();
	if (mode < 0 || mode > 3)
		error(33);	/* argument error */
	fb_set_mode(mode);
	fb_mode = mode;
	fgcolor = fb_rgb2pal(255, 255, 255);
	bgcolor = fb_rgb2pal(0, 0, 0);
	if (mode < 2)
		fb_rectangle(0, 0, 511, 287, bgcolor);
	last_x = 0;
	last_y = 0;
	normret;
}


int
color(void)
{
	char buf[16];
	STR st;
	int c, color = 0;
	int bg = 0;
	uint32_t i, len;

	/* Skip whitespace */
	c = getch();
	point--;

	/* First arg string or numeric? */
	if (checktype()) {
		st = stringeval();
		NULL_TERMINATE(st);
		len = strlen(st->strval);
		if (len == 0 || len > 15) {
			FREE_STR(st);
			error(33);	/* argument error */
		}
		for (i = 0; i <= len; i++)
			buf[i] = tolower(st->strval[i]);
		FREE_STR(st);
		if (buf[0] == '#') {
			if (len != 7)
				error(33);	/* argument error */
			for (i = 1; i < 7; i++) {
				c = buf[i];
				if (!isxdigit(c))
					error(33);	/* argument error */
				if (c <= '9')
					color = (color << 4) + c - '0';
				else
					color = (color << 4) + c - 'a' + 10;
			}
		} else {
			i = -1;
			do {
				if (colormap[++i].name == NULL)
					error(33);	/* argument error */
			} while (strcmp(buf, colormap[i].name) != 0);
			color = colormap[i].value;
		}
		color = fb_rgb2pal(color >> 16, (color >> 8) & 0xff,
		    color & 0xff);
	} else
		color = evalint();

	c = getch();
	if (istermin(c))
		point--;
	else {
		if (c != ',')
			error(15);
		bg = evalint();
		check();
		if (bg < 0 || bg > 1)
			error(33);	/* argument error */
	}

	if (bg)
		bgcolor = color & 0xffff;
	else
		fgcolor = color & 0xffff;
	normret;
}


int
plot(void)
{
	int x, y, c;
	int firstdot = 1;

	do {
		x = evalint();
		if(getch() != ',')
			error(SYNTAX);
		y = evalint();
		if (firstdot) {
			fb_plot(x, y, fgcolor);
			firstdot = 0;
		} else
			fb_line(last_x, last_y, x, y, fgcolor);
		last_x = x;
		last_y = y;
		c = getch();
		if (istermin(c)) {
			point--;
			normret;
		}
		if (c != ',')
			error(15);
	} while (1);
}


int
lineto(void)
{
	int x, y, c;

	do {
		x = evalint();
		if(getch() != ',')
			error(SYNTAX);
		y = evalint();
		fb_line(last_x, last_y, x, y, fgcolor);
		last_x = x;
		last_y = y;
		c = getch();
		if (istermin(c)) {
			point--;
			normret;
		}
		if (c != ',')
			error(15);
	} while (1);
}


int
rectangle(void)
{
	int x0, y0, x1, y1;
	int c, fill = 0;

	x0 = evalint();
	if(getch() != ',')
		error(SYNTAX);
	y0 = evalint();
	if(getch() != ',')
		error(SYNTAX);
	x1 = evalint();
	if(getch() != ',')
		error(SYNTAX);
	y1 = evalint();

	c = getch();
	if (istermin(c))
		point--;
	else {
		if (c != ',')
			error(15);
		fill = evalint();
		check();
		if (fill < 0 || fill > 1)
			error(33);	/* argument error */
	}

	if (fill)
		fb_rectangle(x0, y0, x1, y1, fgcolor);
	else {
		fb_line(x0, y0, x1, y0, fgcolor);
		fb_line(x1, y0, x1, y1, fgcolor);
		fb_line(x1, y1, x0, y1, fgcolor);
		fb_line(x0, y1, x0, y0, fgcolor);
	}
	normret;
}


int
circle(void)
{
	int x, y, r;
	int c, fill = 0;

	x = evalint();
	if(getch() != ',')
		error(SYNTAX);
	y = evalint();
	if(getch() != ',')
		error(SYNTAX);
	r = evalint();

	c = getch();
	if (istermin(c))
		point--;
	else {
		if (c != ',')
			error(15);
		fill = evalint();
		check();
		if (fill < 0 || fill > 1)
			error(33);	/* argument error */
	}

	if (fill)
		fb_filledcircle(x, y, r, fgcolor);
	else
		fb_circle(x, y, r, fgcolor);
	normret;
}


int
text(void)
{
	int x, y, c;
	int scale_x = 1;
	int scale_y = 1;
	STR st;

	x = evalint();
	if(getch() != ',')
		error(SYNTAX);
	y = evalint();
	if(getch() != ',')
		error(SYNTAX);
	st = stringeval();
	NULL_TERMINATE(st);
	c = getch();
	if (istermin(c))
		point--;
	else {
		if (c != ',') {
			FREE_STR(st);
			error(15);
		}
		scale_x = evalint() & 0xff;
	}
	c = getch();
	if (istermin(c))
		point--;
	else {
		if (c != ',') {
			FREE_STR(st);
			error(15);
		}
		scale_y = evalint() & 0xff;
	}

	fb_text(x, y, st->strval, (bgcolor << 16) | fgcolor,
	    (scale_x << 16) | scale_y);
	FREE_STR(st);
	normret;
}


/* Input function for JPEG decompression */
static UINT
in_func(JDEC* jd, BYTE* buff, UINT nbyte)
{
	IODEV *dev = (IODEV*)jd->device;
	UINT retval;

	if (buff) {
		/* Read bytes from input stream */
		retval = read(dev->fh, buff, nbyte);
	} else {
		/* Remove bytes from input stream */
		retval = lseek(dev->fh, nbyte, SEEK_CUR) ? nbyte : 0;
	}

	return (retval);
}


/* Output funciton for JPEG decompression */
static UINT
out_func(JDEC* jd, void* bitmap, JRECT* rect)
{
	IODEV *dev = (IODEV*)jd->device;
	UINT y, bws, bwd;
	BYTE *dst;
#if JD_FORMAT < JD_FMT_RGB32
	BYTE *src;
#else
	LONG *src;
#endif

	/* Copy the decompressed RGB rectanglar to the frame buffer (assuming RGB888 cfg) */
#if JD_FORMAT < JD_FMT_RGB32
	src = (BYTE*)bitmap;
	/* Width of source rectangular [byte] */
	bws = 3 * (rect->right - rect->left + 1);
#else
	src = (LONG*)bitmap;
	/* Width of source rectangular [byte] */
	bws = (rect->right - rect->left + 1);
#endif
	/* Left-top of destination rectangular */
	dst = dev->fbuf + (fb_mode + 1) * (rect->top * dev->wfbuf + rect->left);
	/* Width of frame buffer [byte] */
	bwd = (fb_mode + 1) * dev->wfbuf;
	for (y = rect->top; y <= rect->bottom; y++) {
#if JD_FORMAT < JD_FMT_RGB32
		for (uint32_t i = 0, j = 0; i < bws; i += 3, j += (fb_mode + 1)) {
#else
		for (uint32_t i = 0, j = 0; i < bws; i++, j += (fb_mode + 1)) {
#endif
			uint32_t color;
		
#if JD_FORMAT < JD_FMT_RGB32
			color = fb_rgb2pal(src[i], src[i+1], src[i+2]);
#else
			color = fb_rgb2pal(src[i] >> 16, (src[i] >> 8) & 0xff,
			    src[i] & 0xff);
#endif
			if (fb_mode)
				*((uint16_t *) &dst[j]) = color;
			else
				dst[j] = color;
		}
		src += bws; dst += bwd;  /* Next line */
	}

	return (1);    /* Continue to decompress */
}


int
loadjpg(void)
{
	char work_buf[8192];
	STR st;
	JDEC jdec;
	JRESULT r;
	IODEV devid;

	st = stringeval();
	NULL_TERMINATE(st);
	strcpy(work_buf, st->strval);
	FREE_STR(st);
	check();

	if (fb_mode > 1)
		error(24);	/* out of core */

	devid.fh = open(work_buf, O_RDONLY);
	if (devid.fh < 0)
		error(15);

	r = jd_prepare(&jdec, in_func, work_buf, sizeof(work_buf), &devid);
	if (r == JDR_OK) {
		printf("Image dimensions: %u by %u.\n",
		    jdec.width, jdec.height);
		if (jdec.width > 512 || jdec.height > 288) {
			close(devid.fh);
			error(12); /* buffer size overflow in field */
		}

		devid.fbuf = (void *) 0x800b0000; /* XXX hardcoded!!! */
		devid.wfbuf = 512;
		r = jd_decomp(&jdec, out_func, 0);
                if (r != JDR_OK)
                        printf("Failed to decompress: rc=%d\n", r);
	} else {
		printf("Failed to prepare: rc=%d\n", r);
	}
	close(devid.fh);
	normret;
}