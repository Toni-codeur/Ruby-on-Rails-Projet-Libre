class UtilisateursController < ApplicationController
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
    else
      render "new"
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
  end