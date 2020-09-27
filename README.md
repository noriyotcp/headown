# Headown

Markdown Headers Extractor

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'headown'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install headown

## Usage

From this following file

```markdown
# h1

This is h1.

## h2

This is h2.

### h3

This is h3.

#### h4

This is h4.

##### h5

This is h5.

###### h6

This is h6.

```

Extracts headers only

```shell script
$ headown extract ./spec/headown/sample.md
# h1
## h2
### h3
#### h4
##### h5
###### h6
```

From online

```shell script
$ headown extract https://raw.githubusercontent.com/noriyotcp/headown/main/spec/headown/sample.md
# h1
## h2
### h3
#### h4
##### h5
###### h6
```

ATX headings can interrupt paragraphs

```markdown
****
## foo
****

<hr />
<h2>foo</h2>
<hr />
```

So, it extracts headers

```shell script
$ headown extract ./spec/headown/sample2.md
# baz
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noriyotcp/headown. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/noriyotcp/headown/blob/main/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Headown project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/noriyotcp/headown/blob/main/CODE_OF_CONDUCT.md).
