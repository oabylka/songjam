class Jam < ApplicationRecord
	belongs_to :user
	has_many :jam_participants
end
