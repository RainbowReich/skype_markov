# SkypeMarkov

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

bot_chat = Skype.chats.find { |c| c.members.include? "username" }

bot = SkypeMarkov::Bot.new("username", bot_chat)

bot.post(1) #post one sentence.
```

Each bot that you create will have its own dictionary created from all of the specified user's messages in chat.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/skype_markov/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
