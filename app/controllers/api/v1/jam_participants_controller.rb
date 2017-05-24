class Api::V1::JamParticipantsController < ApplicationController
	def index
		@timeline_jams = JamParticipant.where(user_id: current_user.id, status:"attending")
	end

	def create
		p params
		input_jam_id = params[:jam_id]
		my_jams = JamParticipant.where(user_id: current_user.id)
		my_jam_ids = []
		my_jams.each do |jam|
			my_jam_ids << jam.jam_id
		end

		if my_jam_ids.include?(input_jam_id.to_i)
			flash[:success] = "This jam is already in your timeline!"
			@timeline_jams = JamParticipant.where(user_id: current_user.id, status:"attending")
		else
			@timeline_jams = JamParticipant.create(jam_id: params[:jam_id], user_id: params[:user_id], status: "attending")
			if @timeline_jams.save
				render 'index.json.jbuilder'
				flash[:success] = "You've joined the jam!"
			else
				render json: { errors: @person.errors.full_messages}, 
				status: 422
			end
		end
	end
end
