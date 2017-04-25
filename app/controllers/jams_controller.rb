class JamsController < ApplicationController
	def index
		@jams = Jam.all
	end

	def add_jam
		#this is the method to add a jam from the general jams page to "my timeline"
		#the link should only be visible to logged in users

	end

	def show
		jam_id = params[:id]
		@jam = Jam.find_by(id: jam_id)
	end

	def edit
		#should only be available to the person who created the jam
		jam_id = params[:id]
		@jam = Jam.find_by(id: jam_id)
		
	end

	def update
		jam = Jam.find_by(id: params[:id])
		jam_user_id = jam.user_id
		if current_user.id == jam_user_id
			input_name = params[:name]
			input_song = params[:song]
			input_date = params[:date]
			input_location = params[:location]
			input_user_id = current_user.id

			
			@jam = jam.update(name:input_name, song:input_song, date:input_date, 
				location:input_location, user_id:input_user_id)

		end 
		redirect_to "/jams/#{jam.id}"
	end

	def create
		input_name = params[:name]
		input_song = params[:song]
		input_date = params[:date]
		input_location = params[:location]
		input_user_id = current_user.id

		@jam = Jam.create(name:input_name, song:input_song, date:input_date, location:input_location, 
			user_id:input_user_id)

		redirect_to "/jams/#{@jam.id}"
	end

	def new
		@jam = Jam.new
	end


end
