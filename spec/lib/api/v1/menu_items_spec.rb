describe 'API::V1::MenuItems', type: :request do
  let(:url) { '/api/v1/menu_items' }
  let(:api_user) { FactoryGirl.create(:user) }
  let(:sample_restaurant) { FactoryGirl.create(:restaurant, name: 'Sample Restaurant') }

  context 'Parameter validation testing' do
    it 'should return 401 when invalid token is given' do
      get [url, sample_restaurant.id].join('/'), token: 'InvalidToken'
      expect(response.status).to eq(401)
    end

    it 'should return 200 when valid token is given' do
      get [url, sample_restaurant.id].join('/'), token: api_user.api_key
      expect(response.status).to eq(200)
    end
  end

  context 'Returned results testing' do
    before do
      @restaurant1 = FactoryGirl.create(:restaurant, name: 'Restaurant 11')
      @restaurant_without_menu_items = FactoryGirl.create(:restaurant, name: 'Restaurant without menu items')

      @menu_item1 = FactoryGirl.create(:menu_item, name: 'Menu Item 111', restaurant_id: @restaurant1.id)
      @menu_item2 = FactoryGirl.create(:menu_item, name: 'Menu Item 112', restaurant_id: @restaurant1.id)
      @menu_item3 = FactoryGirl.create(:menu_item, name: 'Menu Item 113', restaurant_id: @restaurant1.id)
      @menu_item4 = FactoryGirl.create(:menu_item, name: 'Menu Item 114', restaurant_id: @restaurant1.id)
      @menu_item5 = FactoryGirl.create(:menu_item, name: 'Menu Item 115', restaurant_id: @restaurant1.id)
      @menu_item6 = FactoryGirl.create(:menu_item, name: 'Menu Item 116', restaurant_id: @restaurant1.id)

      @tag1 = FactoryGirl.create(:tag, name: 'vegan1')
      @tag2 = FactoryGirl.create(:tag, name: 'kosher1')
      @tag3 = FactoryGirl.create(:tag, name: 'gluten-free1')

      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item1.id, tag_id: @tag1.id)
      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item1.id, tag_id: @tag3.id)
      FactoryGirl.create(:menu_item_tag, menu_item_id: @menu_item2.id, tag_id: @tag2.id)
    end

    it 'should return 404 for non existing restaurant_id' do
      get [url, 44].join('/'), token: api_user.api_key
      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)['error']).to eq('record not found')
    end

    it 'should return empty array for existing restaurant_id with no items' do
      get [url, @restaurant_without_menu_items.id].join('/'), token: api_user.api_key
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([])
    end

    it 'should return data with 2 records (based on pagination)' do
      get [url, @restaurant1.id].join('/'), token: api_user.api_key
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(2)
    end

    it 'should return data with 2 first records (based on pagination)' do
      get [url, @restaurant1.id].join('/'), token: api_user.api_key
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first['id']).to eq(@menu_item1.as_json['id'])
      expect(JSON.parse(response.body).first['name']).to eq(@menu_item1.as_json['name'])
      expect(JSON.parse(response.body).first['description']).to eq(@menu_item1.as_json['description'])

      expect(JSON.parse(response.body).second['id']).to eq(@menu_item2.as_json['id'])
      expect(JSON.parse(response.body).second['name']).to eq(@menu_item2.as_json['name'])
      expect(JSON.parse(response.body).second['description']).to eq(@menu_item2.as_json['description'])
    end

    it 'should return data with 2 last records on the third page' do
      get [url, @restaurant1.id].join('/'), token: api_user.api_key, page: 3
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).last['id']).to eq(@menu_item6.as_json['id'])
      expect(JSON.parse(response.body).last['name']).to eq(@menu_item6.as_json['name'])
      expect(JSON.parse(response.body).last['description']).to eq(@menu_item6.as_json['description'])
    end
  end
end
