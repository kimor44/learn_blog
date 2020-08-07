require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:alert]).not_to be_empty
    end
  end

end
