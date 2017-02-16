require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item) { Item.create!(name: "New Name") }

  describe "attributes" do
    it "has name attribute" do
      expect(item).to have_attributes(name: "New Name")
    end
  end
end
