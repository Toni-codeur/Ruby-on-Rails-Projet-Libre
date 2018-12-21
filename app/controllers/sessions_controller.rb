class SessionsController < ApplicationController
  def new
  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
      if utilisateur.activated?
        log_in utilisateur
        params[:session][:remember_me] == "1" ? remember(utilisateur) : forget(utilisateur)
        redirect_to utilisateur
      else
        message = "Le compte n'est pas activé. "
        message += "Vérifier votre e-mail pour le lien d'activation."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "E-mail ou mot de passe invalide !"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
