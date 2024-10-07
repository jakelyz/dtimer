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
            BarOptions opts;
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
}
