
#include "asm.h"
#include "regdef.h"
#include "io.h"
#include "lcdfunc.h"
#include "libc.h"


char lcdbuf[LCD_ROWS][LCD_COLUMNS];
static int lcd_initialized = 0;

static void lcd_cr(int i)
{
	int cmd;

	switch (i) {
		case 0:
			cmd = 0x80;
			break;
		case 1:
			cmd = 0xc0;
			break;
		case 2:
			cmd = 0x94;
			break;
		case 3:
			cmd = 0xd4;
			break;
	}
	OUTW(IO_LCD_DATA, cmd);
	OUTW(IO_LCD_CTRL, LCD_CTRL_E);	/* control sequence, clock high */
	DELAY(LCD_DELAY);
	OUTW(IO_LCD_CTRL, 0);		/* clock low */
	DELAY(LCD_DELAY);
}

static void lcd_putchar(int c)
{
	int key;

	/* Rescan the rotary key and update position */
	INW(key, IO_LED);
	if ((key & 0x600) == 0x600) {
		if ((oldkey & 0x600) == 0x400 && rotpos < 63)
			rotpos++;
		else if ((oldkey & 0x600) == 0x200 && rotpos > -64)
			rotpos--;
	}
	oldkey = (oldkey & ~0x600) | (key & 0x600);

	OUTW(IO_LCD_DATA, c);		/* char to send */
	OUTW(IO_LCD_CTRL, LCD_CTRL_E | LCD_CTRL_RS); /* data sqn, clock high */
	DELAY(LCD_DELAY);
	OUTW(IO_LCD_CTRL, LCD_CTRL_RS);	/* clock low */
	DELAY(LCD_DELAY);
}

static void lcd_init(void)
{
	int i;

	for (i = 0; i < 3; i++) {
		OUTW(IO_LCD_DATA, 0x38);	/* 8-bit, 2-line mode */
		OUTW(IO_LCD_CTRL, LCD_CTRL_E);	/* ctrl sequence, clk hi */
		DELAY(LCD_DELAY << 10);
		OUTW(IO_LCD_CTRL, 0);		/* clock low */
		DELAY(LCD_DELAY << 10);
	}

	OUTW(IO_LCD_DATA, 0x0c);	/* display on */
	OUTW(IO_LCD_CTRL, LCD_CTRL_E);	/* ctrl sequence, clk lo */
	DELAY(LCD_DELAY << 8);
	OUTW(IO_LCD_CTRL, 0);		/* clock low */
	DELAY(LCD_DELAY << 8);

	lcd_initialized = 1;
}

void lcd_redraw(void)
{
	int i, j, uc, w;
	int *wp;
	char c;

	if (!lcd_initialized)
		lcd_init();

	/* sw3 selects lower / upper case letters */
	INW(uc, IO_LED);
	uc = (uc >> 3) & 0x1;

	for (j = 0; j < LCD_ROWS; j++) {
		lcd_cr(j);
#if 0
		for (i = 0; i < LCD_COLUMNS; i++) {
			c = lcdbuf[j][i];
			if (uc && c >= 'a' && c <= 'z')
				c -= ('a' - 'A');
			lcd_putchar(c);
		}
#else
		for (wp = (int *) &lcdbuf[j][0];
		    wp < (int *) &lcdbuf[j][LCD_COLUMNS]; wp++)
			for (i = 0, w = *wp; i < 4; i++) {
				c = w & 0xff;
				w = w >> 8;
				if (uc && c >= 'a' && c <= 'z')
					c -= ('a' - 'A');
				lcd_putchar(c);
			}
#endif
	}
}
