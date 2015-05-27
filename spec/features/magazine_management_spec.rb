require "rails_helper"

feature "managing magazines" do
	scenario "can create a magazine and view links for the magazines on the root page" do
		visit root_path
		expect(page).to_not have_content("Browsing All Magazines")
		expect(page).to have_content("No Magazines Are Present")

		click_on "New Magazine"
		expect(current_path).to eq new_magazine_path
		expect(page).to_not	have_content "Unable to save. Please fill out all fields."

		click_on "Create Magazine"
		expect(page).to have_content("Unable to save. Please fill out all fields.")

		fill_in "Title", with: "PC Gamer"
		click_on "Create Magazine"

		expect(page).to have_content "PC Gamer Added"
		expect(current_path).to eq root_path

		Magazine.create!(title: "National Geographic")

		visit root_path
		expect(page).to_not have_content "PC Gamer Added"
		expect(page).to_not have_content "No Magazines Are Present"
		expect(page).to have_content "Browsing All Magazines"
		expect(page).to have_link "National Geographic"

		click_on "PC Gamer"
		expect(current_path).to eq magazine_path(Magazine.first)
		expect(page).to have_content "No Editions Present"
	end

	scenario "can create editions for a magazine" do
		Magazine.create!(title: "National Geographic")
		visit root_path

		click_on "New Edition"
		expect(current_path).to eq new_edition_path
		expect(page).to_not have_content("Unable to save. Please fill out all fields")

		click_on "Create Edition"
		expect(page).to have_content("Unable to save. Please fill out all fields")

		fill_in "Edition", with: 11
		fill_in "Issue", with: 11
		fill_in "Date", with: Date.today
		select "National Geographic", from: "Magazines"

		click_on "Create Edition"
		expect(page).to have_content("New Edition For National Geographic Saved")
		expect(current_path).to eq edition_path(Edition.last)
		expect(page).to have_content "National Geographic Edition 11, Issue 11: Published #{Date.today.strftime('%m-%d-%Y')}."
	end

	scenario "can edit editions for a magazine" do
		magazine = Magazine.create!(title: "National Geographic")
		Magazine.create!(title: "PC Gamer")
		edition = Edition.create!(magazine_id: magazine.id, edition: 1, issue: 1, date: Date.today)

		visit edition_path(edition)

		click_on "Edit Edition"

		select "PC Gamer", from: "Magazines"

		click_on "Update Edition"

		expect(page).to have_content("Edition For PC Gamer Saved")
	end
end