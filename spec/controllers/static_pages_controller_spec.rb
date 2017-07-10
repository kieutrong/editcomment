require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #introduce" do
    it "returns http success" do
      get :introduce
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

end
