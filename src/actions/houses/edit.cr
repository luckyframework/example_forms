class Houses::Edit < BrowserAction
  get "/houses/:house_id/edit" do
    house = HouseQuery.find(house_id)
    html EditPage,
      operation: SaveHouse.new(house),
      house: house
  end
end
