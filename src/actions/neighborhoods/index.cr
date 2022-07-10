class Neighborhoods::Index < BrowserAction
  get "/neighborhoods" do
    neighborhoods = NeighborhoodQuery.new

    html IndexPage, neighborhoods: neighborhoods
  end
end
