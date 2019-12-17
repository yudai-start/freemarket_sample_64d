require 'rails_helper'

describe Item do
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

      # 1. @itemsというインスタンス変数が期待される値を持っているかどうか
      it "itemsに期待される値を持つ" do
        items = create(:items)
        get :index, items_id: items
        expect(assigns(:items)).to eq items
      end

      # 2. @itemsからpriceという値を数字で取れているか
      it "itemsからpriceを数字で取れているか" do
        items = create(:items)
        price: "1000"
        expect(price).to eq "1000"
      # 3. @itemsからnameという値を文字列で取れているか
      it "itemsからnameという値を文字列で取れているか" do
        items = create(:items)
        name: "ポーチ"
        expect(name).to eq "ポーチ"
      # 4. itemsテーブルとヒモ付いたimagesテーブルからurlで値を取れているか
      it "itemsテーブルと紐づいたimagesテーブルからurlで値を取れているか" do
        items = create(:items)
        expect(image).to eq "kabao.jpg"

    end
  end
end