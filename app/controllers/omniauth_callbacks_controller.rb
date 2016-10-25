class OmniauthCallbacksController < ApplicationController

	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		#raise request.env["omniauth.auth"].to_yaml
		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
			return
		end
		#session["devise.auth"] = request.env["omniauth.auth"]
		#render :edit
	end

	def custom_sign_up		
		if current_user.player.update(params.require(:player).permit(:nickname, :dni_dotero, :name, :lastname, :phone))
			sign_in_and_redirect current_user, event: :authentication
		else
			return
		end
	end

	def failure
	  redirect_to new_user_session_path, notice: "Error: #{params[:error_description]}. Motivo: #{params[:user_denied]}"
	end

	private

	def user_params
	  params.require(:user).permit(:name, :username,	:email)
	end
end
