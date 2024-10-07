module dtimer.window;

import core.thread;
public import deimos.ncurses;
import std.string: toStringz;
import dtimer.render;
import dtimer.timer;

struct Wsize
{
    uint height;
    uint width;
    uint centerx;
    uint centery;
}

Wsize getWindowDimensions()
{
    uint height = getmaxy(stdscr);
    uint width = getmaxx(stdscr);
    return Wsize(height, width, (width / 2), (height / 2));
}

void start(Timer t)
{
    initscr();
    scope(failure)
        endwin();    
    scope(exit)
        endwin();
    cbreak();
    noecho();

    refresh();

    while(!t.complete)
    {
        clear();
        render(t);
        curs_set(0);
        refresh();
        Thread.sleep(1.seconds);
        t.cycle;
    }

    endwin();
}
