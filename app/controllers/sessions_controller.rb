class SessionsController < ApplicationController
  def new

  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
      log_in utilisateur
      params[:session][:remember_me] == "1" ? remember(utilisateur) : forget(utilisateur)
      # remember utilisateur
      
      redirect_to utilisateur
    else
      # Message d'erreur
      flash.now[:danger] = "E-mail ou mot de passe invalide !"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
