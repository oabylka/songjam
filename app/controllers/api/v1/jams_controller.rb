class Api::V1::JamsController < ApplicationController

	def index
		@jams = Jam.all
	end

	
end
