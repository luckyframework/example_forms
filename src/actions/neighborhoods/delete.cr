class Neighborhoods::Delete < BrowserAction
  delete "/neighborhoods/:neighborhood_id" do
    neighborhood = NeighborhoodQuery.find(neighborhood_id)
    DeleteNeighborhood.delete(neighborhood) do |operation, deleted_neighborhood|
      if operation.deleted?
        flash.success = "The record has been deleted"
        redirect Index
      else
        flash.failure = "Could not delete the record"
        html ShowPage, neighborhood: neighborhood
      end
    end
  end
end
