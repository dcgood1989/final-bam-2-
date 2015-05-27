require "rails_helper"

describe User do
	describe "validations" do
		let(:valid_attributes) {
			{
				email: "bobross@example.com", 
				password: "password", 
				password_confirmation: "password"
			}
		}
		it "can be valid" do
			user = User.new(valid_attributes)

			expect(user.valid?).to eq true
		end

		it "is invalid witout an email" do
			valid_attributes[:email] = nil
			user = User.new(valid_attributes)

			expect(user.valid?).to eq false
			expect(user.errors[:email]).to eq ["can't be blank"]
		end
	end
end