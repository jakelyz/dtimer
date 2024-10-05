module dtimer.timer;

import core.thread;
import std.format;
import std.stdio;
import dtimer.options;
import dtimer.util;

struct Timer 
{
    uint duration;

    void run()
    {
        int remaining = this.duration;    
        while(remaining > 0)
        {
            stdout.write(format("\rRemaining: %s", dtimer.util.secondsToHumanReadable(remaining)));    
            stdout.flush();
            Thread.sleep(1.seconds);
            --remaining;
        }
    }
}

Timer newTimer()
{
    return Timer(dtimer.util.durationToSeconds(dtimer.options.duration));
}        
