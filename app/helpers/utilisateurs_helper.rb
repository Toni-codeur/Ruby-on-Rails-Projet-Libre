module UtilisateursHelper
  def gravatar_for(utilisateur, options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(utilisateur.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: utilisateur.nom, class: "gravatar")
  end
end
