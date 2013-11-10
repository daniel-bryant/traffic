class Map < ActiveRecord::Base
  after_initialize :default_map_values

  private

    def default_map_values
      self.lat ||= 38.8951
      self.lon ||= -77.0367
      self.zoom ||= 11
    end
end
