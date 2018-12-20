class Utilisateur < ApplicationRecord
  attr_accessor :remember_token
  before_save {self.email = email.downcase }
  validates :nom, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def utilisateur.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Utilisateur.new_token
    update_attribute(:remember_digest, utilisateur.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password(remember_token)
  end
end
