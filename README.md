# Gawky
![](http://photon.abstractj.org/gawky.jpg)

A tiny and simple console tool for pull requests

## Requirements

- Ruby 1.9 or superior
- Install bundler

    `$ gem install bundler`

## Installation

    $ [sudo] gem install gawky

Or if you want the latest changes

    $ [sudo] gem install gawky --pre

Copy the sample.json file to gawky.json at your HOME directory

    $ cp sample.json $HOME/.gawky.json

Please make sure to change the values:

    {
       "token":"42", //GitHub token
       "maxElapsedDays":5
    }

See [github article](https://help.github.com/articles/creating-an-access-token-for-command-line-use) about how to create the Github token

## Usage

    $ gawky [organization name]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gawky/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add unit tests, because the project doesn't have it. Yeah, bring me a torch.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

