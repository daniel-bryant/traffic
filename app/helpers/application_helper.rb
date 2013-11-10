module ApplicationHelper

  # Return map head if map is present
  def map_head(map)
    if !map.empty?
      render 'layouts/map'
    end
  end
end
