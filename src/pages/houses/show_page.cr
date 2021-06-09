class Houses::ShowPage < MainLayout
  needs house : House
  quick_def page_title, "House with id: #{house.id}"

  def content
    link "Back to all Houses", Houses::Index
    h1 "House with id: #{house.id}"
    render_actions
    render_house_fields
  end

  def render_actions
    section do
      link "Edit", Houses::Edit.with(house.id)
      text " | "
      link "Delete",
        Houses::Delete.with(house.id),
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
