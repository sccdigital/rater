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
					has_many :ratings, :as => :rateable, :class_name => 'Rater::Rating', :dependent => :destroy
					include Rater::ActsAsRated::Base::InstanceMethods
					# extend Rater::ActsAsRated::Base::SingletonMethods
				end
			end
		
			module InstanceMethods
				def average_rating
					rating = self.ratings.average(:stars)
					if rating.nil?
					  0
					else
					  rating
					end
				end
			end
			
			# module SingletonMethods
			# 	def rate(rating)
			# 		rating = Rater::Rating.new({:rateable_id => self.id, :rateable_type => self.class, :stars => rating})
			# 		rating.save
			# 	end
			# end
			
		end
	end
end

::ActiveRecord::Base.send :include, Rater::ActsAsRated::Base