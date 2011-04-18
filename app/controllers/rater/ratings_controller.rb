class Rater::RatingsController < ApplicationController

  def create
    @rating = Rater::Rating.new()
		
		@rating.rateable_type = params[:rateable_type]
		@rating.rateable_id = params[:rateable_id]
		@rating.stars = params[:stars]
		
    respond_to do |format|
			
			if session["rating_#{@rating.rateable_type}_#{@rating.id}"].present?
				@error = "We're very sorry, but you can only rate something once."
				format.html { redirect_to params[:back] || root_url, :error => @error }
				format.js {render :action => 'error'}
			else

				if @rating.save
					session["rating_#{@rating.rateable_type}_#{@rating.id}"] = @rating.stars
				
		      format.html { redirect_to params[:back] || root_url }
		      format.js {}
				else
					@error = "Woops, there was a problem that kept that rating from being saved. Please try again."
					format.html { redirect_to params[:back] || root_url, :error => @error }
					format.js {render :action => 'error'}
				end

			end
			
    end # respnd_to
  end # create

end