require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has email' do
    user = User.new email: 'hai@x.com'
    expect(user.email).to eq 'hai@x.com'  
  end
end
