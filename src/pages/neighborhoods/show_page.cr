class Neighborhoods::ShowPage < MainLayout
  needs neighborhood : Neighborhood
  quick_def page_title, "Neighborhood with id: #{neighborhood.id}"

  def content
    link "Back to all Neighborhoods", Neighborhoods::Index
    h1 "Neighborhood with id: #{neighborhood.id}"
    render_actions
    render_neighborhood_fields
  end

  def render_actions
    section do
      link "Edit", Neighborhoods::Edit.with(neighborhood.id)
      text " | "
      link "Delete",
      Neighborhoods::Delete.with(neighborhood.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_neighborhood_fields
    ul do
      li do
        text "name:"
        nbsp
        strong neighborhood.name
      end
    end
  end
end
