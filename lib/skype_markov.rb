require "skype_markov/version"
require 'skype'
require 'marky_markov'

module SkypeMarkov
  @@config = { :user_path => "/etc/markov_bot/users/" }
  ::Skype.config :app_name => "markov_bot"
  
  def self.chats
    ::Skype.chats
  end
  
  def self.config
    @@config
  end
  
  def self.chat
    self.chats[0]
  end
  
  
  class Bot
    
    attr_accessor :user, :chat, :dictionary
    
    def initialize(user, chat = nil, dict = nil)
      @user = user
      @chat = chat
      @dictionary = dict
      @chat = SkypeMarkov.chat if chat.nil?
      generate_dictionary if dict.nil? && !File.exist?('#{SkypeMarkov.config[:user_path]}#{@user}.mmd')
    end
    
    def generate_dictionary
      @dictionary = MarkyMarkov::Dictionary.new(SkypeMarkov.config[:user_path] + @user)
      @chat.messages.select { |m| m.user == @user }.each do |m|
        @dictionary.parse_string(m.body)
      end
      @dictionary.save_dictionary!
    end
    
    def post(num_sentences)
      @chat.post(@dictionary.generate_n_sentences(num_sentences))
    end
    
  end
  
end
