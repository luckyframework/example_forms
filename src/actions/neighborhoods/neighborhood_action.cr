abstract class NeighborhoodAction < BrowserAction
  route_prefix "/neighborhoods/:neighborhood_id"

  expose neighborhood

  private memoize def neighborhood : Neighborhood
    NeighborhoodQuery.new.find(neighborhood_id)
  end
end
