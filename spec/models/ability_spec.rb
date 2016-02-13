require 'rails_helper'
require "cancan/matchers"

describe 'User' do
  describe 'abilities' do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context 'when is a admin' do
      let(:user){ FactoryGirl.create :admin }

      it{ should be_able_to(:manage, :all) }
      it{ should be_able_to(:access, :rails_admin) }
      it{ should be_able_to(:dashboard, :all) }
    end

    context 'when is a regular user' do
      let(:user){ FactoryGirl.create :user }

      it{ should be_able_to(:manage, Task.new) }
      it{ should should_not be_able_to(:access, :rails_admin) }
      it{ should should_not be_able_to(:dashboard, :all) }

    end
  end
end