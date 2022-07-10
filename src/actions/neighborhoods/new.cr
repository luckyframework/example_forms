class Neighborhoods::New < BrowserAction
  get "/neighborhoods/new" do
    html NewPage, operation: SaveNeighborhood.new
  end
end
