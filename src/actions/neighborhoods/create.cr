class Neighborhoods::Create < BrowserAction
  post "/neighborhoods" do
    SaveNeighborhood.create(params) do |operation, neighborhood|
      if neighborhood
        flash.success = "The record has been saved"
        redirect Show.with(neighborhood.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
