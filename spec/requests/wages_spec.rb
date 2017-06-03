require 'rails_helper'

RSpec.describe "Wages", type: :request do
  describe "GET /wages" do
    it "works! (now write some real specs)" do
      get wages_path
      expect(response).to have_http_status(200)
    end
  end
end
