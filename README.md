# smartless

`smartless` is a pager that behaves just like `less`, but will show the file (or input) directly in the terminal if it is short enough to fit in the terminal height. For longer files (or if multiple files are passed), the pager is still invoked, and only the first and last few lines will be kept in the terminal (so everything is still visible without scrolling), with a truncation message in the middle. The full contents can optionally be recorded and later recalled via a short ID.

Here is a small demo:

https://github.com/user-attachments/assets/89352bdf-cafd-491f-a185-82406b0272dd

The original author (Stefan Heule) wrote a [blog post](http://stefanheule.com/blog/posts/2015-06-07/smartless-a-better-pager-for-small-and-large-inputs/) about his project.

## Dependencies

- `smartless` requires `bash`, common shell tools `cat`, `sed`, `rev`, `tac`, `tee`, `wc`, and a pager like `less`. All are available by default on most Unix systems.
- To consider wrapping of lines that are longer than the terminal width the [`nowrap` command](https://github.com/goodell/nowrap) and `pkill` are needed. Without those, full physical lines will be counted, and this can lead to scrolling of output in the terminal.
- For recalling captured output, `grep` is needed.
- To save disk space by de-duplicating captures, the [`rdfind` command](https://rdfind.pauldreik.se/) is used if available.

## Installation

Download or clone the Git repository (cloning allows easy updating via `git pull`):

    git clone [--branch stable] https://github.com/inkarkat/smartless.git
    
- The `./bin` subdirectory is supposed to be added to `PATH`.
- The optional `./profile/exports.sh` script sets up the pager and capture directory. It needs to be sourced from a shell startup script (e.g. `.profile` or `.bashrc`).
- Also see the [aliases](#aliases) section below.

## Usage

`smartless` is designed as a drop-in replacement for `less`.  For instance, to view the output of a command `cmd`, use

```bash
cmd | smartless
```

It is also possible to pass filename(s) directly:

```bash
smartless file.txt
```

Multiple files will always launch the pager. All other parameters are forwarded to the pager. For instance, `smartless +G` will jump to the end of the file in `less`.

### Aliases

To replace less completely, it is possible to define an alias in most shells. For bash and zsh, the following line will allow the usage of `smartless` when typing `less`.

```bash
alias less='/path/to/smartless'
```

It can be useful to define an additional alias for jumping directly to the end of the input. I like to call that alias `more`, but other more descriptive names are imaginable:

```bash
alias more='/path/to/smartless +G'
```

## Configuration

Several optional environment variables control `smartless`. These are described here, including their default values.

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

Copyright (c) 2015, Stefan Heule \
Copyright (c) 2017-2024 Ingo Karkat

 Licensed under the **Apache License, Version 2.0** (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
