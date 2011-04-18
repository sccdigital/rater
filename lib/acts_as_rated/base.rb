module Rater
	module ActsAsRated
		module Base
			def self.included(klass)
				klass.class_eval do
					extend Config
				end
			end

			module Config
				def acts_as_rated
					has_many :ratings, :as => :rateable, :class_name => 'Rater::Rating'
					include Rater::ActsAsRated::Base::InstanceMethods
				end
			end
		
			module InstanceMethods
				def average_rating
					'ratings come in here.'
				end
			end
		end
	end
end

::ActiveRecord::Base.send :include, Rater::ActsAsRated::Base