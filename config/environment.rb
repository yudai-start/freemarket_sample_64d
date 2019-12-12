# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# master keyの指定漏れを防ぐため追加
# config.require_master_key = true
