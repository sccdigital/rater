Rails.application.routes.draw do
  namespace :rater do
    match 'rating/:_type/:id/:rating' => 'ratings#create', :as => :new_rating
	end
end