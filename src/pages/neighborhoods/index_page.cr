class Neighborhoods::IndexPage < MainLayout
  needs neighborhoods : NeighborhoodQuery
  quick_def page_title, "All Neighborhoods"

  def content
    h1 "All Neighborhoods"
    link "New Neighborhood", to: Neighborhoods::New
    render_neighborhoods
  end

  def render_neighborhoods
    ul do
      neighborhoods.each do |neighborhood|
        li do
          link neighborhood.name, Neighborhoods::Show.with(neighborhood)
        end
      end
    end
  end
end
