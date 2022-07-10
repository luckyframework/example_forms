class Neighborhoods::Show < BrowserAction
  get "/neighborhoods/:neighborhood_id" do
    html ShowPage, neighborhood: NeighborhoodQuery.find(neighborhood_id)
  end
end
