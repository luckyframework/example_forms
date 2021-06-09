class Houses::Update < BrowserAction
  put "/houses/:house_id" do
    house = HouseQuery.find(house_id)
    SaveHouse.update(house, params) do |operation, updated_house|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_house.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, house: updated_house
      end
    end
  end
end
