class Location
  # return { latitude: x.x, longitude: x.x }
  def coordinates(address)
    coord = Geocoder.coordinates(address)
    coord.nil? ? coordinates(address) : res = { latitude: coord[0], longitude: coord[1] }
    [res[:latitude], res[:longitude]]
  end
end
