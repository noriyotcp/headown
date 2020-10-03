<a name="v0.2.0"></a>
## [v0.2.0](https://github.com/noriyotcp/headown/compare/v0.1.0...v0.2.0) (2020-10-03)

### Add

* Add Headown::Extractor which has logic to extract headers
* Add CHANGELOG.md
* Add .chglog which contains git-chglog's config and template files

### Create

* Create ruby.yml

### Improve

* Improve test against html file path
* Raise Headown::NotMarkdownError in constructor in Headown::Extractor
* Raise Headown::NotMarkdownError when file path is not Markdown file

### Update

* Move require 'headown/cli' to exe/headown
* Update README.md
* Update CHANGELOG.md

### Pull Requests

* Merge pull request [#4](https://github.com/noriyotcp/headown/issues/4) from noriyotcp/noriyotcp-patch-1
* Merge pull request [#3](https://github.com/noriyotcp/headown/issues/3) from noriyotcp/extractor-class
* Merge pull request [#2](https://github.com/noriyotcp/headown/issues/2) from noriyotcp/extract-require-headown-cli
* Merge pull request [#1](https://github.com/noriyotcp/headown/issues/1) from noriyotcp/detect-file-extension

<a name="v0.1.0"></a>
## v0.1.0 (2020-09-27)

### Add

* Add sample2.md to test against interruption paragraphs for ATX headings
* Add test against passing url
* Add puts_headers to print headers out to stdout

### Exec

* Exec bundle exec rbprettier --write '**/*.rb'

### Improve

* Extract from sample markdown file
* Improve sample.md

### Install

* Install prettier gem
* Install thor
* Install gems

### Update

* Update README.md
* Update gemspec
* Update headown.gemspec
