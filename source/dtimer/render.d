module dtimer.render;

import std.conv;
import std.string: toStringz;
import dtimer.options;
import dtimer.timer;
import dtimer.util;
import dtimer.window;

private:

int adjustx(uint centerx, string content)
{
    return to!int(centerx - (content.length / 2));    
}

void display(int y, int x, string content)
{
    mvprintw(y, x, content.toStringz);
}

public:

void render(Timer t)
{
    Wsize dimensions = getWindowDimensions;
    if (t.name != null)
    {
        display(dimensions.centery - 1, adjustx(dimensions.centerx, t.name), t.name);
    }

    auto remainingString = t.remaining.secondsToHumanReadable;
    display(dimensions.centery, adjustx(dimensions.centerx, remainingString), remainingString);

    if (dtimer.options.progressBar) 
    {
        display(dimensions.centery + 1, adjustx(dimensions.centerx, t.bar.tostr), t.bar.tostr);    
    }
}
