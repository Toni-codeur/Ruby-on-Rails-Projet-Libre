class UtilisateursController < ApplicationController
  def  show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def new
    @utilisateur = Utilisateur.new
  end
end
