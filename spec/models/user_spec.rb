require 'rails_helper'

RSpec.describe User, type: :model do
  it 'generates a valid 32 GUID after user creation' do
    user1 = create :user

    expect(user1.api_key).not_to be_empty
    expect(user1.api_key.length).to eq(32)
  end
end
