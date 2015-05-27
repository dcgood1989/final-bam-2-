require "rails_helper"

describe Magazine do
	let(:valid_attributes) {
		{
			title: "PC Gamer"
		}
	}

	describe "validations" do
		it "can be valid" do
			magazine = Magazine.new(valid_attributes)
			expect(magazine.valid?).to eq true
		end

		it "is invalid without a title" do
			valid_attributes[:title] = nil
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq false
		end
	end

	describe "associations" do
		it "responds to editions" do
			magazine = Magazine.create!(valid_attributes)
			edition = Edition.create!(magazine_id: magazine.id, edition: 1, issue: 1, date: Date.today)

			expect(magazine.editions).to eq [edition]
		end
	end
end