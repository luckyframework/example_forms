class Neighborhoods::Houses::IndexPage < MainLayout
  needs neighborhood : Neighborhood
  needs houses : HouseQuery
  quick_def page_title, "All Houses"

  def content
    h1 "All Houses"
    link "New House", to: Neighborhoods::Houses::New.with(neighborhood)
    render_houses
  end

  def render_houses
    ul do
      houses.each do |house|
        li do
          link house.blurb, Neighborhoods::Houses::Show.with(neighborhood, house)
        end
      end
    end
  end
end
