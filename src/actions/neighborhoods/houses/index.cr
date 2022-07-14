class Neighborhoods::Houses::Index < NeighborhoodAction
  get "/houses" do
    html IndexPage, houses: HouseQuery.new.neighborhood_id(neighborhood.id)
  end
end
