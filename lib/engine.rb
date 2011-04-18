require 'rater'
require 'rails'

module Rater
	class Engine < Rails::Engine
		config.mount_at = "/"
	end
end