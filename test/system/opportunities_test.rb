require "application_system_test_case"

class OpportunitiesTest < ApplicationSystemTestCase
  setup do
    @opportunity = opportunities(:one)
  end

  test "visiting the index" do
    visit opportunities_url
    assert_selector "h1", text: "Opportunities"
  end

  test "creating a Opportunity" do
    visit opportunities_url
    click_on "New Opportunity"

    fill_in "Description", with: @opportunity.description
    fill_in "Initial date", with: @opportunity.initial_date
    fill_in "Salary", with: @opportunity.salary
    fill_in "Title", with: @opportunity.title
    click_on "Create Opportunity"

    assert_text "Opportunity was successfully created"
    click_on "Back"
  end

  test "updating a Opportunity" do
    visit opportunities_url
    click_on "Edit", match: :first

    fill_in "Description", with: @opportunity.description
    fill_in "Initial date", with: @opportunity.initial_date
    fill_in "Salary", with: @opportunity.salary
    fill_in "Title", with: @opportunity.title
    click_on "Update Opportunity"

    assert_text "Opportunity was successfully updated"
    click_on "Back"
  end

  test "destroying a Opportunity" do
    visit opportunities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Opportunity was successfully destroyed"
  end
end
