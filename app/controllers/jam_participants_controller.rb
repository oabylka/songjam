class JamParticipantsController < ApplicationController
	before_action :authenticate_user!

	def index
		@jam_participants = JamParticipant.where(user_id: current_user.id)

	end

end
