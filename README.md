# rasbat.se

This is the repo for my website at https://rasbat.se

I'm making my own Static Site Generator written in Ruby

## How it Works

### § 1. The Config File

This project makes use of [TOML](https://toml.io/) using the [Tomlrb](https://github.com/fbernier/tomlrb) gem.

In the build process of a route, the program will use `/config.toml`
as the base and overwrite it with new data found in succeeding files.
Specifically, it adheres to the following hierarchy, in the specified
order:

1. `/config.toml`
2. `/routes/<PathToRoute>/__dir__.toml` (if it exists)
3. `/routes/<PathToRoute>/<Route>.toml` (if it exists)

The program will only look inside the route's containing directory
for files to use- there is no recursion. Keys found in `__dir__.toml`
will overwrite those in `/config.toml`. Likewise, `<Route>.toml` will
overwrite keys found in `/config.toml` and `__dir__.toml` since it is
the most specific entry.

Below is the complete syntax for all options in this project.
Note, however, that additional keys can be freely created if need be.

```toml
[path] # (ALL REQUIRED)
inserts = <String> # app/inserts
layouts = <String> # app/layouts
models = <String> # app/models
routes = <String> # app/routes
static = <String> # app/static
output = <String> # build
[build]
layout = <String> # default = layouts/default.erb (REQUIRED)
model = <String> # default = models/default.erb (REQUIRED)
parser = <String> # assumes from file extension; use html, erb, md, etc 
[document]
favicon = <Boolean> # whether or not it should be included
lang = <String> # see https://html.spec.whatwg.org/multipage/dom.html#attr-lang
title = <String>
description = <String>
keywords = <StringArray> # case-sensitive
author = <String>
[document.robots]
index = <Boolean> # true = index, false = noindex
follow = <Boolean> # true = follow, false = nofollow
```

#### § 1.1. Caveats

In Ruby, this overwriting of key/value pairs is done using something
called "deep merging" with hashes. The project's implementation of
deep merging (it's not a standard Ruby thing) only merges nested hashes,
any other type of value simply gets replaced with the new one. People have
made implementations that also factor in arrays, combining the array elements,
but I chose not to use that for the sake of simplicity.