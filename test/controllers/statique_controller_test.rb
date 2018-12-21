require "test_helper"

class StatiqueControllerTest < ActionDispatch::IntegrationTest
  def setup
    @baseTitle = "Tutoriel RoR Udemy"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Accueil | #{@baseTitle}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact | #{@baseTitle}"
  end

  test "should get team" do
    get team_url
    assert_response :success
    assert_select "title", "Team | #{@baseTitle}"
  end

  test "should get services" do
    get services_url
    assert_response :success
    assert_select "title", "Services | #{@baseTitle}"
  end
end
