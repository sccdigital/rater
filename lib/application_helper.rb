module ApplicationHelper
	def rater_link(object, rating, klass='')
    link_to "<span>#{rating.to_s}</span>".html_safe, rater_create_rating_path(object.class.to_s, object.id, rating, :back => request.url), :remote => true, :class => klass
  end

	def rater_interface_for(object)
		identifier = "rating_#{object.class.to_s}_#{object.id}"
		user_rating = session[identifier] || 0
		current_rating = object.average_rating || 0
		
		if user_rating > 0
			ret = "<div class=\"rating-interface rated\" id=\"#{identifier}\">"
		else
			ret = "<div class=\"rating-interface\" id=\"#{identifier}\">"
		end
		
		
		(1..5).each do |star|
			if star <= current_rating + 0.5
				klass = 'active'
			else
				klass = 'inactive'
			end
		
			ret << rater_link(object, star, klass)
		end
		ret << "</div>"
		ret.html_safe
	end
end