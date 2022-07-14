class Neighborhoods::Houses::Show < NeighborhoodAction
  get "/houses/:house_id" do
    html ShowPage, house: HouseQuery.find(house_id)
  end
end
