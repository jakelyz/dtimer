module dtimer.util;

import std.conv;
import std.stdio;
import std.string;
import std.regex;

private:

uint hoursToSeconds(uint hours)
{
    return (hours * 3600);
}

uint minutesToSeconds(uint minutes)
{
    return (minutes * 60);
}

public:

uint durationToSeconds(string duration)
{
    uint seconds = 0;   
    auto timeRegex = regex([`\d+h`, `\d+m`, `\d+s`]);
    auto matches = duration.matchAll(timeRegex);

    if (!matches.empty)
    {
        foreach(m; matches)
        {
            switch(m.whichPattern)
            {
                case 1:    
                    seconds = seconds + to!uint(m.hit.strip("h")).hoursToSeconds;    
                    break;
                case 2:
                    seconds = seconds + to!uint(m.hit.strip("m")).minutesToSeconds;
                    break;
                case 3:
                    seconds = seconds + to!uint(m.hit.strip("s"));
                    break;
                default:
                    break;
            }
        }
    }
    return seconds;
}

@("convert seconds string to uint")
unittest
{
    const seconds = "30s";
    const result = durationToSeconds(seconds);
    const expected = 30;
    assert(result == expected);
}

@("convert minutes string to uint")
unittest
{
    const minutes = "2m";
    const result = durationToSeconds(minutes);
    const expected = 120;
    assert(result == expected);
}

@("convert hours string to uint")
unittest
{
    const hours = "1h";
    const result = durationToSeconds(hours);
    const expected = 3600;
    assert(result == expected);
}

@("convert complex string to uint")
unittest
{
    const complexTime = "1h2m30s";
    const result = durationToSeconds(complexTime);
    const expected = 3750;
    assert(result == expected);
}
