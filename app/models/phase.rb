class Phase < ActiveRecord::Base
	has_many :teams
	has_many :matches
end
