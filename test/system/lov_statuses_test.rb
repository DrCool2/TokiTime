require "application_system_test_case"

class LovStatusesTest < ApplicationSystemTestCase
  setup do
    @lov_status = lov_statuses(:one)
  end

  test "visiting the index" do
    visit lov_statuses_url
    assert_selector "h1", text: "Lov Statuses"
  end

  test "creating a Lov status" do
    visit lov_statuses_url
    click_on "New Lov Status"

    fill_in "Status", with: @lov_status.status
    click_on "Create Lov status"

    assert_text "Lov status was successfully created"
    click_on "Back"
  end

  test "updating a Lov status" do
    visit lov_statuses_url
    click_on "Edit", match: :first

    fill_in "Status", with: @lov_status.status
    click_on "Update Lov status"

    assert_text "Lov status was successfully updated"
    click_on "Back"
  end

  test "destroying a Lov status" do
    visit lov_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lov status was successfully destroyed"
  end
end
