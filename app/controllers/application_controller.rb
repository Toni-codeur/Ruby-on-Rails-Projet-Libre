class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def premier
    render html: "Bonjour tout le monde"
  end
end
