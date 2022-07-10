class Neighborhoods::Edit < BrowserAction
  get "/neighborhoods/:neighborhood_id/edit" do
    neighborhood = NeighborhoodQuery.find(neighborhood_id)
    html EditPage,
      operation: SaveNeighborhood.new(neighborhood),
      neighborhood: neighborhood
  end
end
