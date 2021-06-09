class Houses::NewPage < MainLayout
  needs operation : SaveHouse
  quick_def page_title, "New House"

  def content
    h1 "New House"
    render_house_form(operation)
  end

  def render_house_form(op)
    form_for Houses::Create do
      # Edit fields in src/components/houses/form_fields.cr
      mount Houses::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
