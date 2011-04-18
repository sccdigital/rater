class Rater::Rating < ActiveRecord::Base
  validates_presence_of :rateable_type
  validates_presence_of :rateable_id
  belongs_to :rateable, :polymorphic => true
end