class Neighborhoods::Houses::Delete < NeighborhoodAction
  delete "/houses/:house_id" do
    HouseQuery.find(house_id).delete
    flash.success = "Deleted the record"
    redirect Index.with(neighborhood)
  end
end
