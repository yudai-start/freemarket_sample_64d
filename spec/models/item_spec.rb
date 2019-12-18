require 'rails_helper'

describe Item do

  describe "#destroy" do
    
    context "as an authorized user" do
      it "deletes an item" do
        sign_in @user
        expect {
          delete :destroy, params: {id: @item.id}
        }.to change(@user.item, :count).by(-1)
      end
      it "redirects the page to root_path" do
        sign_in @user
        delete :destroy, params: {id: @item.id}
        expect(response).to redirect_to root_path
      end
    end

    context "as an unauthorized user" do
      it "does not delete an item" do
        sign_in @user
        another_item = @another_user.items.build(:item)
        expect {
          delete :destroy, params: {id: another_item.id}
        }.to_not change(@another_user.items, :count)
      end
      it "redirects the page to root_path" do
        sign_in @user
        another_item = @another_user.items.build(:item)
        delete :destroy, params: {id: another_item.id}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#create" do
    
    context "can not save" do
      
      it "is invalid without a name" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a user_id" do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without a size" do
        item = build(:item, size: nil)
        item.valid?
        expect(item.errors[:size]).to include("can't be blank")
      end

      it "is invalid without a item_status" do
        item = build(:item, item_status: nil)
        item.valid?
        expect(item.errors[:item_status]).to include("can't be blank")
      end

      it "is invalid without a shipping_fee_defrayer" do
        item = build(:item, shipping_fee_defrayer: nil)
        item.valid?
        expect(item.errors[:shipping_fee_defrayer]).to include("can't be blank")
      end

      it "is invalid without a shipping_system" do
        item = build(:item, shipping_system: nil)
        item.valid?
        expect(item.errors[:shipping_system]).to include("can't be blank")
      end

      it "is invalid without a ship_from_prefecture" do
        item = build(:item, ship_from_prefecture: nil)
        item.valid?
        expect(item.errors[:ship_from_prefecture]).to include("can't be blank")
      end

      it "is invalid without a ship_date" do
        item = build(:item, ship_date: nil)
        item.valid?
        expect(item.errors[:ship_date]).to include("can't be blank")
      end

      it "is invalid without a price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it "is invalid without a description" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end

      it "is invalid without a buyer_id" do
        item = build(:item, buyer_id: nil)
        item.valid?
        expect(item.errors[:buyer_id]).to include("can't be blank")
      end

      it "is invalid without a status" do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end


    end
  end
end