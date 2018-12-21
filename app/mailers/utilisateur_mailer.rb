class UtilisateurMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.utilisateur_mailer.account_activation.subject
  #
  def account_activation(utilisateur)
    @utilisateur = utilisateur
    mail to: utilisateur.email, subject: "Activation du compte"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.utilisateur_mailer.password_reset.subject
  #
  def password_reset(utilisateur)
    @utilisateur = utilisateur
    mail to: utilisateur.email, subject: "Réinitialisation du mot de passe"
  end
end
