module dtimer.bar;

import std.algorithm.comparison: min;
import std.conv;
import std.range: repeat;

struct BarOptions
{
    int width;
    char fill_char;
    char empty_char;
    char bar_start_char;
    char bar_end_char;
}

class Bar 
{
    private:    
        int total, current, width;
        char fill_char, empty_char, bar_start_char, bar_end_char;

    double progress()
    {
        return min(1.0, (this.current / cast(double)this.total));    
    }

    public:

    this(int total, BarOptions opts)
    {
        this.total = total;
        this.current = 0;
        this.width = opts.width;
        this.fill_char = opts.fill_char;
        this.empty_char = opts.empty_char;
        this.bar_start_char = opts.bar_start_char;
        this.bar_end_char = opts.bar_end_char;
    }

    final void increment()
    {
        ++this.current;
    }

    final string tostr()
    {
        int fill_len = to!int(this.width * progress);    
        int empty_len = this.width - fill_len;
        string filled = to!string(this.fill_char.repeat(fill_len));
        string empty = to!string(this.empty_char.repeat(empty_len));
        return this.bar_start_char ~ filled ~ empty ~ this.bar_end_char;
    }

}

unittest
{
    BarOptions opts = BarOptions(10, '-', ' ', '[', ']');
    auto bar = new Bar(10, opts);
    bar.increment;
    const string expected = "[-         ]";
    const string result   = bar.tostr;
    assert(expected == result);
}
