require "application_system_test_case"

class MinutesTest < ApplicationSystemTestCase
  setup do
    @minute = minutes(:one)
  end

  test "visiting the index" do
    visit minutes_url
    assert_selector "h1", text: "Minutes"
  end

  test "creating a Minute" do
    visit minutes_url
    click_on "New Minute"

    fill_in "Category", with: @minute.category
    fill_in "Content", with: @minute.content
    fill_in "Start", with: @minute.start
    fill_in "Stop", with: @minute.stop
    fill_in "Total", with: @minute.total
    fill_in "User", with: @minute.user_id
    click_on "Create Minute"

    assert_text "Minute was successfully created"
    click_on "Back"
  end

  test "updating a Minute" do
    visit minutes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @minute.category
    fill_in "Content", with: @minute.content
    fill_in "Start", with: @minute.start
    fill_in "Stop", with: @minute.stop
    fill_in "Total", with: @minute.total
    fill_in "User", with: @minute.user_id
    click_on "Update Minute"

    assert_text "Minute was successfully updated"
    click_on "Back"
  end

  test "destroying a Minute" do
    visit minutes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Minute was successfully destroyed"
  end
end
