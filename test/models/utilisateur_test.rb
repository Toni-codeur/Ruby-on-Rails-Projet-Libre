require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase
  def setup
    @utilisateur = Utilisateur.new(
      nom: "Exemple Utilisateur", 
      email: "utilisateur@exemple.com",
      password: "exemple",
      password_confirmation: "exemple"
    )
  end

  test "should be valid" do
    assert @utilisateur.valid?
  end

  test "nom should be present" do
    @utilisateur.nom = "    "
    assert_not @utilisateur.valid?
  end

  test "email should be present" do
    @utilisateur.email = "    "
    assert_not @utilisateur.valid?
  end

  test "nom should not be too long" do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end

  test "email should not be too long" do
    @utilisateur.email = "a" * 244 + "@exemple.com"
    assert_not @utilisateur.valid?
  end

  test "email validation should accept valid addresses" do
    adresses_valides = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp justine+jean@baz.cn]
    adresses_valides.each do |adresse_valide|
      @utilisateur.email = adresse_valide
      assert @utilisateur.valid?, "#{adresse_valide.inspect} doit être valide."
    end
  end
  
  test "email validation should reject invalid addresses" do
    adresses_invalides = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
    adresses_invalides.each do |adresse_invalide|
      @utilisateur.email = adresse_invalide
      assert_not @utilisateur.valid?, "#{adresse_invalide.inspect} doit être invalide."
    end
  end
  
  test "email addresses should be unique" do
    utilisateur_duplique = @utilisateur.dup
    utilisateur_duplique.email = @utilisateur.email.upcase
    @utilisateur.save
    assert_not utilisateur_duplique.valid?
  end

  test "password should be present" do
    @utilisateur.password = @utilisateur.password_confirmation + " " * 6
    assert_not @utilisateur.valid?
  end

  test "password should have a minimum length" do
    @utilisateur.password = @utilisateur.password_confirmation + "a" * 5
    assert_not @utilisateur.valid?
  end

end
