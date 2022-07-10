class Neighborhoods::EditPage < MainLayout
  needs operation : SaveNeighborhood
  needs neighborhood : Neighborhood
  quick_def page_title, "Edit Neighborhood with id: #{neighborhood.id}"

  def content
    link "Back to all Neighborhoods", Neighborhoods::Index
    h1 "Edit Neighborhood with id: #{neighborhood.id}"
    render_neighborhood_form(operation)
  end

  def render_neighborhood_form(op)
    form_for Neighborhoods::Update.with(neighborhood.id) do
      mount Neighborhoods::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
