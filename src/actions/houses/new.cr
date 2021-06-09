class Houses::New < BrowserAction
  get "/houses/new" do
    html NewPage, operation: SaveHouse.new
  end
end
