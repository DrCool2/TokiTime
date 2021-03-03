require "application_system_test_case"

class TokisTest < ApplicationSystemTestCase
  setup do
    @toki = tokis(:one)
  end

  test "visiting the index" do
    visit tokis_url
    assert_selector "h1", text: "Tokis"
  end

  test "creating a Toki" do
    visit tokis_url
    click_on "New Toki"

    fill_in "Clock in", with: @toki.clock_in
    fill_in "Clock out", with: @toki.clock_out
    fill_in "Note", with: @toki.note
    click_on "Create Toki"

    assert_text "Toki was successfully created"
    click_on "Back"
  end

  test "updating a Toki" do
    visit tokis_url
    click_on "Edit", match: :first

    fill_in "Clock in", with: @toki.clock_in
    fill_in "Clock out", with: @toki.clock_out
    fill_in "Note", with: @toki.note
    click_on "Update Toki"

    assert_text "Toki was successfully updated"
    click_on "Back"
  end

  test "destroying a Toki" do
    visit tokis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Toki was successfully destroyed"
  end
end
