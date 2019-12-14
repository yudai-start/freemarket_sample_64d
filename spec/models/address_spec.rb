require 'rails_helper'

describe Address do


describe '#create' do

  context "can not save" do

    it "is invalid without a family_name" do
      address = build(:address, family_name: nil)
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_kana" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a post_code" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a street_number" do
      address = build(:address, street_number: nil)
      address.valid?
      expect(address.errors[:street_number]).to include("can't be blank")
    end

    it "is invalid without a phone_number" do
      address = build(:address, phone_number: nil)
      address.valid?
      expect(address.errors[:phone_number]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end


    end
  end
end