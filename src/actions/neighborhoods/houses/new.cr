class Neighborhoods::Houses::New < NeighborhoodAction
  get "/houses/new" do
    html NewPage, operation: SaveHouse.new
  end
end
