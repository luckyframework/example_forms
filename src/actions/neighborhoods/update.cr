class Neighborhoods::Update < BrowserAction
  put "/neighborhoods/:neighborhood_id" do
    neighborhood = NeighborhoodQuery.find(neighborhood_id)
    SaveNeighborhood.update(neighborhood, params) do |operation, updated_neighborhood|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_neighborhood.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, neighborhood: updated_neighborhood
      end
    end
  end
end
