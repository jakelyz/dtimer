import std.getopt;
import std.stdio;
import dtimer.options;
import dtimer.timer;

private:

const string VERSION = "0.1.0";

public:

int main(string[] args)
{
    bool _version;    
    auto helpInformation = getopt(
      args,
      "version|v", "version", &_version,
      std.getopt.config.required,
      "duration|d", "duration, ex: 30s, 1m, 5m30s, etc", &dtimer.options.duration,
      "name|n", "name of the timer", &dtimer.options.name,
      "progress|p", "display progress bar", &dtimer.options.progressBar); 

    if (helpInformation.helpWanted)
    {
        defaultGetoptPrinter("usage: dtimer [options]",
                                  helpInformation.options);
        return 0;
    }

    if (_version)
    {
        writeln(VERSION);
        return 0;
    }

    Timer t = newTimer();
    t.run();
    return 0;
}
