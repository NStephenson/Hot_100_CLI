# Hot100CLI

Welcome to your the Hot 100 CLI!. This gem scrapes the Billboard Top 100 page (http://www.billboard.com/charts/hot-100) and gives the full top 100 list, additiontional info on each song, and will allow the user to launch links to the song on spotify or vevo if available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Hot_100_CLI'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Hot_100_CLI

## Usage

To use, type `ruby bin/HOT-100-CLI` in your command line after navigating to the root of this repo.

Upon opening, Hot 100 CLI will display the top ten songs on the chart for the current week. After this, there are a variety of inputs you can give for more information about the list.

"Hot 100" - Displays the full hot 100 listing

"Artists" - Displays a list of all the artists on the list, alphabetized.

"Song [song name]" - Displays information on the name of the song given. This will also give an option of playing the song or viewing the music video of the song.

"Artist [artist name]" - Displays a list of all the songs by the given artist that appears on the Billboard Top 100.

"Help" - Displays the list of available inputs.

- Additionally, inputting a number between 1 and 100 will display more info on the song in that position. Giving a range of numbers between 1 and 100 separated with a hyphen will show all the entires on the list between those two numbers.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nstephenson/Hot_100_CLI.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

