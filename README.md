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
with `\n\n// ---\n\n`. All of the specs can be extracted at once by running
`$('.language-typescript').toArray().map(x => x.innerText).join('\n\n//
---\n\n')` in the browser JavaScript console.
