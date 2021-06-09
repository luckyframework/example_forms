class Houses::Create < BrowserAction
  post "/houses" do
    SaveHouse.create(params) do |operation, house|
      if house
        flash.success = "The record has been saved"
        redirect Show.with(house.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
