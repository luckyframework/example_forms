class Houses::Delete < BrowserAction
  delete "/houses/:house_id" do
    HouseQuery.find(house_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
