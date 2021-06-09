class Houses::Show < BrowserAction
  get "/houses/:house_id" do
    html ShowPage, house: HouseQuery.find(house_id)
  end
end
