describe 'API::V1::Restaurants', type: :request do
  let(:url) { '/api/v1/restaurants' }
  let(:api_user) { FactoryGirl.create(:user) }

  context 'Parameter validation testing' do
    it 'should return 401 when invalid token is given' do
      get url, token: 'InvalidToken'
      expect(response.status).to eq(401)
    end

    it 'should return 200 when valid token is given' do
      get url, token: api_user.api_key
      expect(response.status).to eq(200)
    end
  end


  context 'Returned results testing' do
    before do
      @restaurant1 = FactoryGirl.create(:restaurant, name: 'Restaurant 1')
      @restaurant2 = FactoryGirl.create(:restaurant, name: 'Restaurant 2')
      @restaurant3 = FactoryGirl.create(:restaurant, name: 'Restaurant 3')
      @restaurant4 = FactoryGirl.create(:restaurant, name: 'Restaurant 4')

      @menu_item1 = FactoryGirl.create(:menu_item, name: 'Menu Item 1', restaurant_id: @restaurant1.id)
      @menu_item2 = FactoryGirl.create(:menu_item, name: 'Menu Item 2', restaurant_id: @restaurant1.id)
      @menu_item3 = FactoryGirl.create(:menu_item, name: 'Menu Item 3', restaurant_id: @restaurant1.id)

      @menu_item11 = FactoryGirl.create(:menu_item, name: 'Menu Item 12', restaurant_id: @restaurant2.id)
      @menu_item12 = FactoryGirl.create(:menu_item, name: 'Menu Item 12', restaurant_id: @restaurant2.id)
      @menu_item13 = FactoryGirl.create(:menu_item, name: 'Menu Item 13', restaurant_id: @restaurant2.id)

      @tag1 = FactoryGirl.create(:tag, name: 'vegan')
      @tag2 = FactoryGirl.create(:tag, name: 'kosher')
      @tag3 = FactoryGirl.create(:tag, name: 'gluten-free')

      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item1.id, tag_id: @tag1.id)
      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item1.id, tag_id: @tag3.id)
      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item2.id, tag_id: @tag2.id)
    end

    it 'should return data with 2 records (based on pagination)' do
      get url, token: api_user.api_key
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(2)
    end

    it 'should return data with 2 first records (based on pagination)' do
      get url, token: api_user.api_key
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first['id']).to eq(@restaurant1.as_json['id'])
      expect(JSON.parse(response.body).first['name']).to eq(@restaurant1.as_json['name'])
      expect(JSON.parse(response.body).first['description']).to eq(@restaurant1.as_json['description'])

      expect(JSON.parse(response.body).second['id']).to eq(@restaurant2.as_json['id'])
      expect(JSON.parse(response.body).second['name']).to eq(@restaurant2.as_json['name'])
      expect(JSON.parse(response.body).second['description']).to eq(@restaurant2.as_json['description'])
    end

    it 'should return data with 2 next records on the second page' do
      get url, token: api_user.api_key, page: 2
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first['id']).to eq(@restaurant3.as_json['id'])
      expect(JSON.parse(response.body).first['name']).to eq(@restaurant3.as_json['name'])
      expect(JSON.parse(response.body).first['description']).to eq(@restaurant3.as_json['description'])

      expect(JSON.parse(response.body).second['id']).to eq(@restaurant4.as_json['id'])
      expect(JSON.parse(response.body).second['name']).to eq(@restaurant4.as_json['name'])
      expect(JSON.parse(response.body).second['description']).to eq(@restaurant4.as_json['description'])
    end
  end
end
