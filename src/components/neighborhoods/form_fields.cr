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
  end
end
