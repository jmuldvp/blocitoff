require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "Some User", email: "user@bloc.com", password: "password")}
end
