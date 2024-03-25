require 'rails_helper'

RSpec.describe FarmPolicy, type: :policy do
  subject { described_class }

  permissions :new? do
    describe 'grant access if user has no farm' do
      let(:user) { create :user, farm: nil }

      it { is_expected.to permit(user, nil) }
    end

    describe 'deny access if user has a farm' do
      let(:user) { create :user, farm: create(:farm) }

      it { is_expected.not_to permit(user, nil) }
    end
  end

  permissions :show? do
    describe 'grant access if it’s user’s farm' do
      let(:user) { create :user }
      let(:farm) { create :farm, user: }

      it { is_expected.to permit(user, farm) }
    end

    describe 'deny access if it’s not user’s farm' do
      let(:user) { create :user }
      let(:farm) { create :farm }

      it { is_expected.not_to permit(user, farm) }
    end
  end

  permissions :create? do
    describe 'grant access if user has no farm' do
      let(:user) { create :user, farm: nil }

      it { is_expected.to permit(user, nil) }
    end

    describe 'deny access if user has a farm' do
      let(:user) { create :user, farm: create(:farm) }

      it { is_expected.not_to permit(user, nil) }
    end
  end
end
