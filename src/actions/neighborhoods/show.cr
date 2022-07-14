class Neighborhoods::Show < BrowserAction
  get "/neighborhoods/:neighborhood_id" do
    html ShowPage, neighborhood: NeighborhoodQuery.new.preload_houses.find(neighborhood_id)
  end
end
