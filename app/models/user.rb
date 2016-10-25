class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
          :omniauth_providers => [:facebook]
  include PermissionsConcern
  belongs_to :team
  belongs_to :player
  
  def self.from_omniauth(auth)
  	where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
  		if auth[:info]
  			user.email = if auth[:info][:email].nil? || auth[:info][:email].empty? then "#{auth[:info][:name].split(" ").join("")}@gmail.com" else auth[:info][:email] end
        user.username = "#{auth[:info][:first_name]}#{rand(1000..5000)}"
        user.first_name = auth[:info][:first_name]
        user.last_name = auth[:info][:last_name]
  			user.name = auth[:info][:name]
        user.image = auth[:info][:image]
        @player = Player.create()
        user.player_id = @player.id
  		end
  		user.password = Devise.friendly_token[0,20]
  	end
  end
end
