require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'email validation' do
    it 'is valid if email is correct' do
      user = User.new(email: '12345qwerty@i.ua', password: '12345678')
      expect(user.valid?).to eq(true)
    end

    it 'is invalid if email is incorrect' do
      user = User.new(email: '@#!Qqwe!@i.ua', password: '12345678')
      expect(user.valid?).to eq(false)
    end
  end


end
