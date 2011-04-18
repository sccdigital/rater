class RatingsController < ApplicationController
  def create
    @rating = Rating.new(params[:rating])
    respond_to do |format|
      format.html { redirect_to params[:previous_url] }
      format.js {}
    end
  end
end