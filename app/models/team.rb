class Team < ActiveRecord::Base
  belongs_to :perfomance
  belongs_to :key
  belongs_to :phase
  has_many :players
  has_many :groups
  has_many :lowerbrackets
  has_many :upperbrackets
  has_many :matches
  has_one :user
end
