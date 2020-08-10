require 'rails_helper'

RSpec.feature 'admin::manage', type: :feature do
  context 'Go to manage page' do
    let(:user) { User.create!(email: 'coucou@gmail.com', admin: true, password: 'azerty') }

    context 'user is logged' do
      before { sign_in(user: user) }
      it 'arrives on the main page' do
        expect(current_path).to eq(root_path)
      end
    end
  end
end
