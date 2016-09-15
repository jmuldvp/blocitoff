require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:user) { create(:user) }

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{ post :create, user_id: user.id, item: {name: "New Item"} }.to change(Item,:count).by(1)
    end

    it "increases the sum of user items by 1" do
      count = user.items.count
      post :create, user_id: user.id, item: {name: "Another Item"}
      expect(user.items.count).to eq(count + 1)
    end
  end

  describe "DELETE destroy" do

    before do
      sign_in user
      @item = create(:item, user: user)
    end

    it "deletes the item" do
      delete :destroy, format: :js, user_id: user.id, id: @item.id
      count = Item.where({id: @item.id}).count
      expect(count).to eq(0)
    end

    it "returns http success" do
      delete :destroy, format: :js, user_id: user.id, id: @item.id
      expect(response).to have_http_status(:success)
    end
  end
end
