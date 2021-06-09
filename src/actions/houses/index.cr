class Houses::Index < BrowserAction
  get "/houses" do
    html IndexPage, houses: HouseQuery.new
  end
end
