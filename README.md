# smartless

`smartless` is a pager that behaves just like `less`, but will show the file (or output) directly to the terminal if it is short enough to fit in the terminal height.  For longer files, the pager is still invoked, and only the leading and trailing lines will be kept in the terminal, with a truncation message in the middle.

Here is a small demo, and I have also written a [blog post](http://stefanheule.com/blog/posts/2015-06-07/smartless-a-better-pager-for-small-and-large-inputs/) about this project.

![smartless demo](http://stefanheule.com/blog/img/posts/smartless.gif)

## Prerequisites

`smartless` requires `bash`, `sed`, and a pager like `less`.  All are available by default on most Unix systems.

To consider wrapping of lines that are longer than the terminal width the [`nowrap` command](https://github.com/goodell/nowrap) is needed. Without it, full physical lines will be counted, and this can lead to scrolling of output in the terminal.

## Installation

The simplest way to install the script is to download it directly into `/usr/local/bin`:

    curl https://raw.githubusercontent.com/inkarkat/smartless/master/smartless -o /usr/local/bin/smartless
    chmod +x /usr/local/bin/smartless # <-- mark it as executable

Alternatively, you can clone the git repository, which allows easy updating by doing `git pull`:

    git clone https://github.com/inkarkat/smartless.git
    ln -s smartless/smartless /usr/local/bin/smartless # <-- make it available system-wide as "smartless"
    
See also the [aliases](#aliases) section below.

## Usage

`smartless` is designed as a drop-in replacement for `less`.  For instance, to view the output of a command `cmd`, use

```bash
cmd | smartless
```

It is also possible to pass a filename directly:

```bash
smartless file.txt
```

Finally, all other parameters are forwarded to the pager.  For instance, `smartless +G` will jump to the end of the file in `less`.

### Aliases

To replace less completely, it is possible to define an alias in most shells.  For bash and zsh, the following line will allow the usage of `smartless` when typing `less`.

```bash
alias less='/path/to/smartless'
```

It can be useful to define an additional alias for jumping directly to the end of the input.  I like to call that alias `more`, but other more descriptive names are imaginable:

```bash
alias more='/path/to/smartless +G'
```

## Configuration

Several optional environment variables control `smartless`.  These are described here, including their default values.

```bash
# number of lines to directly display before entering the pager
SMARTLESS_NUM_LINES= # (terminal height - 5) or 15, if terminal height cannot be discovered automatically

# the pager to be used
SMARTLESS_PAGER='less'

# the default arguments to the pager
SMARTLESS_PAGER_ARGUMENTS='-iR'

# hinted command name to recall full output; this can be overridden if you define a shorter alias and want to use that in the truncation message
SMARTLESS_RECALL_COMMAND=smartless-recall

# highlighting of messages
SMARTLESS_COLOR=$'\e[38;5;2m'
SMARTLESS_COLOR_OFF=$'\e[0m'

# enable capturing of the full output to uniquely named files in the capture directory
SMARTLESS_CAPTURE_DIR=
# template for naming the capture files, cp. "man mktemp"
SMARTLESS_CAPTURE_TEMPLATE='XXXXXX'
# clean up captured output after it hasn't been accessed for 14 days; any
# arguments to "find" can be used here
SMARTLESS_CAPTURE_PRUNE_FINDARGS='-atime +14'
```

## Contributing

Pull requests to improve `smartless` are welcome.

## Credits

This project was originally based on [an answer on StackExchange](http://unix.stackexchange.com/questions/107315/), but has changed significantly since.

This is an independently maintained fork of the original version by Stefan Heule.

## License

> Copyright (c) 2015, Stefan Heule
> Copyright (c) 2017-2024 Ingo Karkat

> Licensed under the **Apache License, Version 2.0** (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at:

>    http://www.apache.org/licenses/LICENSE-2.0

> Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
