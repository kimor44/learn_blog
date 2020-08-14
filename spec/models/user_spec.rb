require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }

  context 'create a user with email, admin and password' do
    it 'is possible' do
      expect(user.valid?).to eq true
    end
  end

  context 'create a user without email' do
    it 'is NOT possible' do
      user.update(email: '')
      expect(user.valid?).to eq false
      expect(user.errors[:email].any?).to eq true
      expect(user.errors[:email].first).to eq 'can\'t be blank'
    end
  end

  context 'create a user without password' do
    it 'is NOT possible' do
      user.update(password: '')
      expect(user.valid?).to eq false
      expect(user.errors[:password].any?).to eq true
      expect(user.errors[:password].first).to eq 'can\'t be blank'
    end
  end
end
