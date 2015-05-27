require "rails_helper"

feature "as a user" do
	scenario "a user can sign up, sign out, and sign back in" do
		visit root_path
		expect(page).to have_link "Sign In"
		expect(page).to_not have_link "Sign Out"
		expect(page).to_not have_content "Logged in as Bob Ross"
		expect(page).to_not have_content "Thanks for signing up!"

		click_on "Sign Up"
		expect(current_path).to eq(new_user_path)

		fill_in "First Name", with: "Bob"
		fill_in "Last Name", with: "Ross"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"

		click_button "Sign Up"
		expect(current_path).to eq(root_path)

		expect(page).to have_content "Thanks for signing up!"
		expect(page).to have_content "Logged in as Bob Ross"
		expect(page).to_not have_link "Sign In"
		expect(page).to_not have_link "Sign Up"

		visit current_path
		expect(page).to have_content "Logged in as Bob Ross"
		expect(page).to_not have_content "Thanks for signing up!"

		click_on "Sign Out"

		expect(page).to have_content "Signed out!"
		expect(page).to_not have_content "Logged in as Bob Ross"

		click_on "Sign In"

		fill_in "First Name", with: "Bob"
		fill_in "Last Name", with: "Ross"
		fill_in "Password", with: "password"

		click_button "Sign In"
		expect(current_path).to eq root_path

		expect(page).to have_content "Thanks for signing in!"
		expect(page).to have_content "Logged in as Bob Ross"
		expect(page).to_not have_link "Sign In"
		expect(page).to_not have_link "Sign Up"

		visit current_path
		expect(page).to have_content "Logged in as Bob Ross"
		expect(page).to_not have_content "Thanks for signing in!"
	end
end