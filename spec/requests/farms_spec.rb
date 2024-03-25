require 'rails_helper'

RSpec.describe "Farms", type: :request do
  login_user

  describe "GET /show" do
    let(:farm) { create(:farm, user: current_user) }

    xit do
      get farm_path(farm)
      expect(response).to render_template(:show)
      expect(response.body).to include(farm.name)
    end
  end
end
