require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "viewing the index" do
    visit root_path
    assert_selector "header", text: "tdnm app"
  end
end
