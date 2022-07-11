class Neighborhoods::FormFields < BaseComponent
  needs operation : SaveNeighborhood

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")
    mount Shared::Field, operation.hoa_fee, &.number_input
    mount Shared::Field, operation.lid_fee, &.number_input
    mount Shared::Field, operation.sid_fee, &.number_input

    div do
      label_for(operation.master_plan)
      checkbox(operation.master_plan)
    end
    div do
      amenities_list.each do |amenity|
        label(amenity, for: "neighborhood_amenities_#{amenity}")
        input type: "checkbox",
          id: "neighborhood_amenities_#{amenity}",
          name: "neighborhood:amenities[]",
          value: amenity,
          attrs: operation.amenities.value.try(&.includes?(amenity)) ? [:checked] : [] of Symbol
      end
    end
  end

  private def amenities_list
    [
      "Pool House",
      "Security Gate",
      "Golf Course",
      "Park"
    ]
  end
end
