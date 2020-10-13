[![Gem Version](https://badge.fury.io/rb/ruby-dap.svg)](https://badge.fury.io/rb/ruby-dap) [![Documentation](https://img.shields.io/static/v1?label=docs&message=master&color=informational&style=flat)](https://firelizzard.gitlab.io/ruby-dap/)

# Ruby Debug Adapter Protocol

This gem provides models, parsers, and formatters for the [Debug Adapter
Protocol](https://microsoft.github.io/debug-adapter-protocol).

## Updating Definitions

The [converter](convert.rb) script can be used to convert TypeScript definitions
from the [DAP
specification](https://microsoft.github.io/debug-adapter-protocol/specification)
to Ruby classes. To regenerate the Ruby classes, set `PRETEND = false` in the
file and run `echo <spec> | ruby convert.rb -` or `ruby convert.rb <spec-file>`.
If the input contains multiple files, `convert.rb` expects them to be separated
with `\n\n// ---\n\n`. All of the specs can be extracted at once by running the
following in the browser JavaScript console:


```javascript
$('.language-typescript').toArray().map(x => {
    x = $(x);
    let s = x.text();
    for (x = x.prev('p'); x.length; x = x.prev('p'))
        s = `// ${x.text()}\n${s}`;
    return s;
}).join('\n\n// ---\n\n')
```
