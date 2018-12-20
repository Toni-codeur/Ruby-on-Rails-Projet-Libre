class UtilisateursController < ApplicationController
  before_action :logged_in_utilisateur, only: [:edit, :update]
  before_action :correct_utilisateur, only: [:edit, :update]

  def index
    @utilisateurs = Utilisateur.paginate(page: params[:page])
  end

  def  show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      #Sauvgarde confirmé <- true
      log_in @utilisateur
      flash[:success] = "Bienvenue sur le clone de Twitter !"
      redirect_to @utilisateur
    else
      render "new"
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update_attributes(utilisateur_params)
      flash[:success] = "Profil mis à jour"
      redirect_to @utilisateur
    else
      render "edit"
    end
  end

  private

  def utilisateur_params
    params.require(:utilisateur).permit(
      :nom, 
      :email, 
      :password, 
      :password_confirmation
    )
  end

  def logged_in_utilisateur
    unless logged_in?
      flash[:danger] = "Merci de vous connecter."
      redirect_to login_url
    end
  end

  def correct_utilisateur
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to(root_url) unless current_utilisateur?(utilisateur)
  end
end
