# SkypeMarkov
[![Gem Version](https://badge.fury.io/rb/skype_markov.svg)](http://badge.fury.io/rb/skype_markov)

SkypeMarkov allows you to create Skype bots that generate Markov chains from messages that users you specify post.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'skype_markov'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skype_markov

## Usage

You must have a running instance of Skype while using this gem.

```ruby

bot_chat = Skype.chats.find { |c| c.members.include? "username" } #find a valid chat object

bot = SkypeMarkov::Bot.new("username", bot_chat) #create a new bot and generate a dictionary for its user

bot.post(1) #post one sentence.
```

Each bot that you create will have its own dictionary created from all of the specified user's messages in chat.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/skype_markov/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
