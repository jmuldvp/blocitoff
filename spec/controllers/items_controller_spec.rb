require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user) }
  let(:item2) { create(:item, user: user) }

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create, format: :js, item_name: item.name
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy, format: :js, item_name: item.name
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{ post :create, user_id: user.id, item: {name: item.name} }.to change(Item,:count).by(1)
    end

    it "increases the sum of user items by 1" do
      count = user.items.count
      post :create, user_id: user.id, item_id: item2.id
      expect(user.items.count).to eq(count + 1)
    end

    it "returns http success" do
      get :create, format: :js, user_id: user.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    before do
      sign_in user
    end

    it "deletes the item" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      count = Item.where({id: item.id}).count
      expect(count).to eq(0)
    end

    it "returns http success" do
      delete :destroy, format: :js, user_id: user.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

end
