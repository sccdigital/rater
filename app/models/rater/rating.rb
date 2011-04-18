class Rating < ActiveRecord::Base
  validates_presence_of :rateable_type
  validates_presence_of :rateable_id
  belongs_to :rateable, :polymorphic => true
end

# What needs to get added to other models:
# has_many :ratings, :as => rateable, :dependent => :destroy
# def average_rating
#   ...
# end