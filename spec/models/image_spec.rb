require 'rails_helper'

describe Image do
  describe "#create" do

    context "can not save" do

      it "is invalid without image" do
        image = build(:image, image: nil)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end

      it "is invalid without item_id" do
        image = build(:image, item_id: nil)
        image.valid?
        expect(image.errors[:item_id]).to include("can't be blank")
      end

    end

  end
end


