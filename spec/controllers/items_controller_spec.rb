require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  
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

end
