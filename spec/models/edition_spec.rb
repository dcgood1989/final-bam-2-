require "rails_helper"

describe Edition do
	let(:magazine) { Magazine.create!(title: "PC Gamer")}
	let(:valid_attributes) {
		{
			magazine_id: magazine.id,
			edition: 10,
			issue: 10,
			date: Date.today
		}
	}

	describe "validations" do
		it "can be valid" do
			edition = Edition.create!(valid_attributes)

			expect(edition.valid?).to eq true
		end

		it "is invalid without a magazine_id" do
			valid_attributes[:magazine_id] = nil
			edition = Edition.new(valid_attributes)

			expect(edition.valid?).to eq false
		end

		it "is invalid without an edition" do
			valid_attributes[:edition] = nil
			edition = Edition.new(valid_attributes)

			expect(edition.valid?).to eq false
		end

		it "is invalid without an issue" do
			valid_attributes[:issue] = nil
			edition = Edition.new(valid_attributes)

			expect(edition.valid?).to eq false
		end

		it "is invalid without a date" do
			valid_attributes[:date] = nil
			edition = Edition.new(valid_attributes)

			expect(edition.valid?).to eq false
		end
	end

	describe "#full_edition" do
		it "prints a full edition string" do
			edition = Edition.create!(valid_attributes)
			expect(edition.full_edition).to eq "Edition 10, Issue 10: Published #{Date.today.strftime('%m-%d-%Y')}"
		end
	end

	describe "associations" do
		it "has a magazine" do
			edition = Edition.create!(valid_attributes)
			expect(edition.magazine).to eq magazine
		end
	end
end