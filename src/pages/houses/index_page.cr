class Houses::IndexPage < MainLayout
  needs houses : HouseQuery
  quick_def page_title, "All Houses"

  def content
    h1 "All Houses"
    link "New House", to: Houses::New
    render_houses
  end

  def render_houses
    ul do
      houses.each do |house|
        li do
          link house.blurb, Houses::Show.with(house)
        end
      end
    end
  end
end
