require 'rater'
require 'rails'
require 'jrails'

module Rater
	class Engine < Rails::Engine
		config.mount_at = "/"
	end
end