class SaveNeighborhood < Neighborhood::SaveOperation
  permit_columns name, hoa_fee, lid_fee, sid_fee, master_plan, amenities
end
