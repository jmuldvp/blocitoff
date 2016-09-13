require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create, format: :js, item_name: item.name
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, format: :js, item_name: item.name
      expect(response).to have_http_status(:success)
    end
  end

end
