# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# For watching Active Record work under the covers on the console
# by redirecting the output to standard output. Use like:
# >> log_to STDOUT
# >> Post.find(:first)
def log_to(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end
