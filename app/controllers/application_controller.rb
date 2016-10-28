class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected

  def authenticate_user!
    redirect_to root_path unless (user_signed_in? && current_user.is_user?) || (user_signed_in? && current_user.is_admin?)
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end
  def complete_register!
    if user_signed_in?
      if current_user.player.dni_dotero.nil?
        flash[:alert] = "DATOS INCOMPLETOS"
        redirect_to "/completar_registro"
        return
      end
    end
  end
end
