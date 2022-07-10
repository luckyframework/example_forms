class Neighborhoods::NewPage < MainLayout
  needs operation : SaveNeighborhood
  quick_def page_title, "New Neighborhood"

  def content
    h1 "New Neighborhood"
    render_neighborhood_form(operation)
  end

  def render_neighborhood_form(op)
    form_for Neighborhoods::Create do
      mount Neighborhoods::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
