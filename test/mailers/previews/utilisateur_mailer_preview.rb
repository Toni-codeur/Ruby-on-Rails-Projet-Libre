# Preview all emails at http://localhost:3000/rails/mailers/utilisateur_mailer
class UtilisateurMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/utilisateur_mailer/account_activation
  def account_activation
    utilisateur = Utilisateur.first
    utilisateur.activation_token = Utilisateur.new_token
    UtilisateurMailer.account_activation(utilisateur)
  end

  # Preview this email at http://localhost:3000/rails/mailers/utilisateur_mailer/password_reset
  def password_reset
    UtilisateurMailer.password_reset
  end
end
