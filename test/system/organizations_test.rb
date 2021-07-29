require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "creating a Organization" do
    visit organizations_url
    click_on "New Organization"

    fill_in "Area", with: @organization.area
    fill_in "City", with: @organization.city
    fill_in "Cnpj", with: @organization.cnpj
    fill_in "Name", with: @organization.name
    fill_in "Num employees", with: @organization.num_employees
    fill_in "Org type", with: @organization.org_type
    fill_in "State", with: @organization.state
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit organizations_url
    click_on "Edit", match: :first

    fill_in "Area", with: @organization.area
    fill_in "City", with: @organization.city
    fill_in "Cnpj", with: @organization.cnpj
    fill_in "Name", with: @organization.name
    fill_in "Num employees", with: @organization.num_employees
    fill_in "Org type", with: @organization.org_type
    fill_in "State", with: @organization.state
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
