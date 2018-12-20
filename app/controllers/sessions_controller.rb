class SessionsController < ApplicationController
  def new

  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
    
    else
      # Message d'erreur
      flash.now[:danger] = "E-mail ou mot de passe invalide !"
      render "new"
    end
  end

  def destroy

  end
end
