class JamParticipantsController < ApplicationController
	before_action :authenticate_user!

	def index
		input_jam_id = params[:jam_id]
		@jam_participants = []
		@timeline_jams = JamParticipant.where(user_id: current_user.id, status:"attending")
		@jam_participants = JamParticipant.where(jam_id: input_jam_id, status:"attending")
		p "*"*100
		p @jam_participants
	end

	def create
		input_jam_id = params[:jam_id]
		input_user_id = current_user.id
		status_id = "attending"
		#creating an array in order to check for duplicate events
		my_jams = JamParticipant.where(user_id: current_user.id)
		my_jam_ids = []
		my_jams.each do |jam|
			my_jam_ids << jam.jam_id
		end


		if my_jam_ids.include?(input_jam_id.to_i)
			flash[:success] = "This jam is already in your timeline!"
			@timeline_jams = JamParticipant.where(user_id: current_user.id, status:"attending")
		else
			@timeline_jams = JamParticipant.create(jam_id:input_jam_id, user_id:input_user_id, status:status_id)
			if @timeline_jams.save
			flash[:success] = "You've joined the jam!"
			redirect_to "/timeline"
			else
				flash[:danger] = "Couldn't join the jam!"
			end
		end
		

	end

	def destroy
		@my_jam = JamParticipant.find_by(id: params[:id])
		@my_jam.status = "not attending"
		@my_jam.save
		
		flash[:success] = "Jam removed from timeline"
		redirect_to "/timeline"
	end


end
