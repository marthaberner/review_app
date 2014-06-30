require 'spec_helper'

describe User do
  describe 'Validations' do
    context 'for a new user' do
      it 'password must be present' do
        user = User.new(password: nil, password_confirmation: nil)

        expect(user.valid?).to eq false
      end

      it 'password is invalid if less than 8 characters' do
        user = User.new(password: 'short', password_confirmation: 'short')

        expect(user.valid?).to eq false
      end

      it 'is invalid if password confirmation is a mismatch' do
        user = User.new(password: 'password', password_confirmation: 'notpassword')

        expect(user.valid?).to eq false
      end
    end
  end
end