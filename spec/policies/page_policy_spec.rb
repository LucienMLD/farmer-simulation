require 'rails_helper'

RSpec.describe PagePolicy, type: :policy do
  subject { described_class }

  permissions 'index?' do
    describe 'grant access' do
      it { is_expected.to permit(nil, nil) }
    end
  end
end
