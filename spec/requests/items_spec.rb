require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "index by page" do
    it "10 items per page" do
      11.times do
        Item.create amount: 100
      end
      expect(Item.count).to eq 11
      get '/api/v1/items'
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 10
      get '/api/v1/items?page=2'
      expect(response).to have_http_status 200 
      json = JSON.parse(response.body)
      expect(json['resources'].size).to eq 1
    end
  end
  describe "create" do
    it "can create an item" do
      # expect(Item.count).to eq(0)
      # post '/api/v1/items', params: { amount: 99 }
      # expect(response).to have_http_status(200)
      # expect(Item.count).to eq(1)
      expect {
        post '/api/v1/items', params: { amount: 99 }
      }.to change { Item.count }.by 1
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)
      expect(json['resources']['amount']).to eq 99
      expect(json['resources']['id']).not_to be_nil
    end
  end
end
