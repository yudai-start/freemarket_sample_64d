require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:user) { create(:user) }
  # let(:address) { create(:address, user_id: user.id) }
  # let(:card) { create(:card, user_id: user.id) }
  # let(:image) { create(:image) }

  describe 'GET #buy_confirm' do

    context 'log in' do
      # user = create(:user)
      before do
        login user
      end

      it "（@itemが期待される値を持つ）assigns the requested item to @item" do
        # user = create(:user)
        # image = create(:image)
        # address = create(:address, user_id: user.id)
        # card = create(:card, user_id: user.id)

        item = create(:item)
        get :buy_confirm, params: { id: item }
        expect(assigns(:item)).to eq item

      end


      it "(buy_confirmのビューが呼び出されるか）renders the : buy_confirm template" do
        # user = create(:user)

        item = create(:item)
        get :buy_confirm, params: { id: item }
        expect(response).to render_template :buy_confirm
      end

    end
  end

end
