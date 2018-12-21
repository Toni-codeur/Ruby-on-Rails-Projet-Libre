module SessionsHelper
  def log_in(utilisateur)
    session[:utilisateur_id] = utilisateur.id
  end

  def current_utilisateur
    if (utilisateur_id = session[:utilisateur_id])
      @current_utilisateur ||= Utilisateur.find_by(id: utilisateur_id)
    elsif (utilisateur_id = cookies.signed[:utilisateur_id])
      utilisateur = Utilisateur.find_by(id: utilisateur_id)
      if utilisateur && utilisateur.authenticated?(:remember, cookies[:remember_token])
        log_in utilisateur
        @current_utilisateur = utilisateur
      end
    end
  end

  def remember(utilisateur)
    utilisateur.remember
    cookies.permanent.signed[:utilisateur_id] = utilisateur.id
    cookies.permanent[:remember_token] = utilisateur.remember_token
  end

  def current_utilisateur?(utilisateur)
    utilisateur == current_utilisateur
  end

  def logged_in?
    !current_utilisateur.nil?
  end

  def forget(utilisateur)
    utilisateur.forget
    cookies.delete(:utilisateur_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_utilisateur)
    session.delete(:utilisateur_id)
    @current_utilisateur = nil
  end
end
