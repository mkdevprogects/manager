# The class is needed to change the clinic's data
# before the clinic is stored in the database
class ClinicBuilder
  def initialize(params)
    @clinic = Clinic.new(params)
  end

  # The method starts a coordinate search and stores coordinates in the database
  # return clinic
  def geocode
    coordinates
    @clinic if @clinic.save
  end

  # add coordinates to clinic
  def coordinates
    @clinic.latitude, @clinic.longitude = Location.new.coordinates(@clinic.address)
  end
end