# Description

Application to test [virtus] **Ruby** gem features.

[![Build Status](https://travis-ci.org/jatap/test-ror-virtus.png)](https://travis-ci.org/jatap/test-ror-virtus)

### Version

[virtus] `~> 0.5.5`

### Personal assessments

> Another DataMapper API to working on some fixed or dynamic flows.

| Rating   | Documentation | Usability |
| :-------:|:-------------:|:---------:|
| 9        | 8             | 10        |

### Wishlist

- [ ] create a module to set_defaults when some coercions or embedded classes are embedded.

### Notes

Replacement to ActiveSupport::Configurable to handle default values in a better way.

## Author
This source code is written by [Julio Antúnez Tarín].

[Julio Antúnez Tarín]: http://twitter.com/jatap
[ruby]: https://www.ruby-lang.org/
[virtus]: https://github.com/solnic/virtus

## Documentation lookup

fastri is unmaintained (last release 2008) and depends on the old RI API
(`rdoc/ri/ri_paths`, `ri_cache`) that RDoc removed, so its `fri`, `qri`,
`fastri-server` and `ri-emacs` executables no longer load; no maintained fork
exists, so it is no longer a dependency. Use plain `ri` instead (`ri
String#upcase`, or `ri -i` for interactive lookup); Emacs users can point
yari.el at `ri`. `yard server` is available for browsing the API docs.
