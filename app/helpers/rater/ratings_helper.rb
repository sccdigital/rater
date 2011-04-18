module Rater::RatingsHelper
  def rater_for(object)
    link_to new_rating_path(request.url)
  end
end