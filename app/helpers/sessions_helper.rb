module SessionsHelper
  def log_in(utilisateur)
    session[:utilisateur_id] = utilisateur.id
  end

  def current_utilisateur
    @current_utilistaeur ||= Utilisateur.find_by(id: session[:utilisateur_id])
  end
end
