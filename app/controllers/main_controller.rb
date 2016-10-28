class MainController < ApplicationController
	before_action :authenticate_admin!, only: [:generar, :crear_ticket]
  before_action :complete_register!, only: [:home, :generar, :bases, :inscripcion, :unirse]
  def home
  end
  def bases
  end
  def generar
  end
  def crear_ticket
    
  end
  def edit
    @user = current_user
  end
  def inscripcion
  	if authenticate_user!
	  	flash[:alert] = "NO ESTAS REGISTRADO REGISTRATE"
      return
  	end
    unless current_user.team.nil?
      flash[:alert] = "YA REGISTRASTE UN EQUIPO"
      return
    end
    @team = Team.new
    render "teams/new"
  end
  def unirse
    if authenticate_user!
      flash[:alert] = "NO ESTAS REGISTRADO REGISTRATE"
      return
    end
  end
  def check_ticket
    @key = Key.find_by(des: params.require(:key).permit(:des)[:des])
    if @key.nil?
      flash[:alert] = "TICKET NO VALIDO"
      redirect_to "/unirse"
      return
    end
    current_user.player.update(team_id: @key.team.id)
    redirect_to team_path(@key.team)
  end
end
