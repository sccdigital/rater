Rails.application.routes.draw do
  namespace :rater do
    match 'ratings/:rateable_type/:rateable_id/:stars' => 'ratings#create', :as => :create_rating
	end
end