# https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-1922580

from kitty.fast_data_types import Screen
from kitty.tab_bar import DrawData, ExtraData, TabBarData, draw_title
from kitty.utils import color_as_int

def as_rgb(x: int) -> int:
    return (x << 8) | 2

def draw_tab(
    draw_data: DrawData, screen: Screen, tab: TabBarData,
    before: int, max_title_length: int, index: int, is_last: bool,
    extra_data: ExtraData
) -> int:
    orig_fg = screen.cursor.fg
    orig_bg = screen.cursor.bg
    left_sep, right_sep = ('', '')

    def draw_sep(which: str) -> None:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
        screen.cursor.fg = orig_bg
        screen.draw(which)
        screen.cursor.bg = orig_bg
        screen.cursor.fg = orig_fg

    draw_sep(left_sep)
    screen.draw(' ')
    draw_title(draw_data, screen, tab, index)
    extra = screen.cursor.x - before - max_title_length
    print("extra:%d" %(extra))
    if extra >= 0:
        screen.cursor.x -= extra + 3
        screen.draw('…')
    elif extra == -1:
        screen.cursor.x -= 2
        screen.draw('…')
    screen.draw(' ')
    draw_sep(right_sep)
    draw_sep(' ')

    return screen.cursor.x
