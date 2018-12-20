module SessionsHelper
  def log_in(utilisateur)
    session[:utilisateur_id] = utilisateur.id
  end

  def current_utilisateur
    @current_utilistaeur ||= Utilisateur.find_by(id: session[:utilisateur_id])
  end

  def logged_in?
    !current_utilisateur.nil?
  end

  def log_out
    session.delete(:utilisateur_id)
    @current_utilisateur = nil
  end
end
