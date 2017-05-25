class HomeController < ApplicationController
  def index
  	@users = User.all
  	@locations = []

  	@users.each_with_index do |user, i|
  		user_location = [user.first_name, user.latitude, user.longitude, i+1]
  		@locations << user_location
  	end
  end
end
