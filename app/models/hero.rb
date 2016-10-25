class Hero < ActiveRecord::Base
	has_many :selecteds
	has_many :matchs
end
