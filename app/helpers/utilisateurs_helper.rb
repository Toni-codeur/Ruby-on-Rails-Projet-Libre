module UtilisateursHelper
  def gravatar_for(utilisateur)
    gravatar_id = Digest::MD5::hexdigest(utilisateur.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: utilisateur.nom, class: "gravatar")
  end
end
