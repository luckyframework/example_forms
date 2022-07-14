class Neighborhoods::Houses::EditPage < MainLayout
  needs operation : SaveHouse
  needs neighborhood : Neighborhood
  needs house : House
  quick_def page_title, "Edit House with id: #{house.id}"

  def content
    link "Back to all Houses", Neighborhoods::Houses::Index.with(neighborhood)
    h1 "Edit House with id: #{house.id}"
    render_house_form(operation)
  end

  def render_house_form(op)
    form_for Neighborhoods::Houses::Update.with(neighborhood, house) do
      # Edit fields in src/components/houses/form_fields.cr
      mount ::Houses::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
