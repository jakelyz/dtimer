module dtimer.printer;

import core.thread;
import std.stdio;
import dtimer.timer;

void start(Timer t)
{
    while(t.remaining >= 0)
    {
        clearLine();    
        write(t.consoleString);
        stdout.flush();
        Thread.sleep(1.seconds);
        t.cycle;
    }
    writeln();
}

void clearLine()
{
    write("\033[0G\033[2K\r");
}        
