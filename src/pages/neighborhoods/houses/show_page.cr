class Neighborhoods::Houses::ShowPage < MainLayout
  needs neighborhood : Neighborhood
  needs house : House
  quick_def page_title, "House with id: #{house.id}"

  def content
    link "Back to all Houses", Neighborhoods::Houses::Index.with(neighborhood)
    h1 "House with id: #{house.id}"
    render_actions
    render_house_fields
  end

  def render_actions
    section do
      link "Edit", Neighborhoods::Houses::Edit.with(neighborhood, house)
      text " | "
      link "Delete",
        Neighborhoods::Houses::Delete.with(neighborhood, house),
        data_confirm: "Are you sure?"
    end
  end

  def render_house_fields
    ul do
      li do
        text "blurb: "
        strong house.blurb.to_s
      end
    end
  end
end
