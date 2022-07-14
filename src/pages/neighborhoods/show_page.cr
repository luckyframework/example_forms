class Neighborhoods::ShowPage < MainLayout
  needs neighborhood : Neighborhood
  quick_def page_title, "Neighborhood with id: #{neighborhood.id}"

  def content
    link "Back to all Neighborhoods", Neighborhoods::Index
    h1 "Neighborhood with id: #{neighborhood.id}"
    render_actions
    render_neighborhood_fields
    render_homes
  end

  def render_actions
    section do
      link("Edit", Neighborhoods::Edit.with(neighborhood.id))
      text " | "
      link("Delete", Neighborhoods::Delete.with(neighborhood.id), data_confirm: "Are you sure?")
      text " | "
      link("View Homes", Houses::Index.with(neighborhood.id))
    end
  end

  def render_neighborhood_fields
    ul do
      li do
        text "name:"
        nbsp
        strong neighborhood.name
      end
      li do
        text "HOA:"
        nbsp
        strong number_to_currency(neighborhood.hoa_fee / 100)
      end
      li do
        text "Master plan?"
        nbsp
        strong neighborhood.master_plan? ? "Yes" : "No"
      end
      li do
        text "Amenities:"
        nbsp
        strong neighborhood.amenities.join(',')
      end
    end
  end

  def render_homes
    div do
      h3 "Amazing homes"
      neighborhood.houses.each do |house|
        link(house.address.street, Neighborhoods::Houses::Show.with(neighborhood, house))
      end
    end
  end
end
