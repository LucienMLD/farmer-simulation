require 'rails_helper'

RSpec.describe DashboardPolicy do
  subject { described_class }

  let(:user) { User.new }

  permissions :index? do
    it 'grants access' do
      expect(subject).to permit(user)
    end
  end
end
