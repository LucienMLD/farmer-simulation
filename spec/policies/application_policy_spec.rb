require 'rails_helper'

RSpec.describe ApplicationPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:record) { create(:user) }

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "denies access" do
      expect(subject).not_to permit(user, record)
    end
  end
end
