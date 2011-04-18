Rails.application.routes.draw do |map|
  namespace :rater do
    map 'rating/:_type/:id/:rating', 'ratings#create', :as => :new_rating
end