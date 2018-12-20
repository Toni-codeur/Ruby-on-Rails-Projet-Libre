class UtilisateursController < ApplicationController
  before_action :logged_in_utilisateur, only: [:index, :edit, :update, :destroy]
  before_action :correct_utilisateur, only: [:edit, :update]
  before_action :admin_utilisateur, only: :destroy

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
      UtilisateurMailer.account_activation(@utilisateur).deliver_now
      flash[:info] = "Merci de consulter votre e-mail pour le lien d'activation de votre compte."
      redirect_to root_url
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

  def destroy
    Utilisateur.find(params:[:id]).destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to utilisateurs_url
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
    redirect_to(root_url) unless current_utilisateur?(@utilisateur)
  end

  def admin_utilisateur
    redirect_to(root_url) unless current_utilisateur.admin?
  end
end
