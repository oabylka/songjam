class SongsController < ApplicationController
	def index
		if !params[:song_name].empty?
			@songs = RSpotify::Track.search(params[:tracks])
		else
			redirect_to songs_path
		end
	end

	def show
	end
end

