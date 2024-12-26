module dtimer.timer;

import dtimer.bar;
import dtimer.options;
import dtimer.util;

class Timer
{
    public:
        int seconds, remaining;
        string name;
        Bar bar;

    this(string duration)
    {
        this.seconds = durationToSeconds(duration);    
        this.remaining = this.seconds;
        this.name = dtimer.options.name;
        if (dtimer.options.progressBar)
        {
            BarOptions opts = BarOptions(
                dtimer.options.width,
                dtimer.options.bar_fill,
                dtimer.options.bar_empty,
                dtimer.options.bar_start,
                dtimer.options.bar_end
            );
            this.bar = new Bar(this.seconds, opts);
        }
    }

    final bool complete() @property
    {
        return this.remaining == 0;    
    }

    final void cycle()
    {
        --this.remaining;    
        if (dtimer.options.progressBar)
        {
            this.bar.increment;    
        }
    }

    final string consoleString()
    {
        string name;    
        if (dtimer.options.name)
        {
            name = " (" ~ dtimer.options.name ~ ")";
        }        
        if (dtimer.options.progressBar)
        {
            return this.bar.tostr ~ " " ~ this.remaining.secondsToHumanReadable ~ name;
        }        
        return this.remaining.secondsToHumanReadable ~ name;
    }        
}
