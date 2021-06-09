class Houses::FormFields < BaseComponent
  needs operation : SaveHouse

  def render
    mount Shared::Field, operation.blurb, &.text_input(autofocus: "true")
    mount Shared::Field, operation.price, &.text_input
    mount Shared::Field, operation.year_built, &.number_input
    mount Shared::Field, operation.bedrooms, &.number_input
    mount Shared::Field, operation.bathrooms, &.number_input(step: "0.25")
    mount Shared::Field, operation.living_sqft, &.number_input
    mount Shared::Field, operation.lot_sqft, &.number_input

    mount Shared::Field, operation.street, &.text_input
    mount Shared::Field, operation.street_2, &.text_input
    mount Shared::Field, operation.city, &.text_input
    mount Shared::Field, operation.state, &.text_input
    mount Shared::Field, operation.zip_code, &.text_input

    div do
      label_for(operation.active_listing)
      checkbox(operation.active_listing)
    end

    select_input(operation.property_type) do
      options_for_select(operation.property_type, house_property_types)
    end

    select_input(operation.status) do
      options_for_select(operation.status, house_status_types)
    end

    multi_select_input(operation.tags) do
      options_for_multi_select(operation.tags, tag_options)
    end
  end

  private def house_property_types
    House::AvramPropertyType.names.map do |e|
      {e, House::PropertyType.new(e)}
    end
  end

  private def house_status_types
    House::AvramStatus.names.map do |e|
      {e, House::Status.new(e)}
    end
  end

  private def tag_options
    [
      {"New Construction", "New Construction"},
      {"VA Benefits", "VA Benefits"},
      {"Priced to Sell", "Priced to Sell"},
      {"No HOA", "No HOA"}
    ]
  end
end
