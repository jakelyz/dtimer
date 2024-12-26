import std.getopt;
import std.stdio;
import dtimer.options;
import dtimer.timer;
import dtimer.printer;

private:

const string VERSION = "0.2.0";

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
      "progress|p", "display progress bar", &dtimer.options.progressBar,
      "width|w", "progress bar width. defaults to 10", &dtimer.options.width,
      "fill-char|f", "character to represent the \"filled\" portion of the progress bar. defaults to \"-\"", &dtimer.options.bar_fill,
      "empty-char|e", "character to represent the \"empty\" portion of the progress bar. defaults to whitespace", &dtimer.options.bar_empty,
      "bar-start-char|a", "character that represents the start of the progress bar. defaults to \"[\"", &dtimer.options.bar_start,
      "bar-end-char|z", "character that represents the end of the progress bar. defaults to \"]\"", &dtimer.options.bar_end
      ); 

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

    Timer t = new Timer(dtimer.options.duration);
    start(t);
    return 0;
}
