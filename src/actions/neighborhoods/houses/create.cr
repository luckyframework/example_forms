class Neighborhoods::Houses::Create < NeighborhoodAction
  post "/houses" do
    SaveHouse.create(params, neighborhood_id: neighborhood.id) do |operation, house|
      if house
        flash.success = "The record has been saved"
        redirect Show.with(neighborhood, house)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
