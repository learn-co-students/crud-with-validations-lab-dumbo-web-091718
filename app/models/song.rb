class Song < ActiveRecord::Base
  validates :title, uniqueness: {scope: :release_year, message: "can only release a song with the same title once per year"}
  validates :released, inclusion: { in: [true, false]}
  validates :title, :artist_name, presence: true
  validate :valid_input?
  # validate :valid_year?
end

def valid_input?
  if self.released == true
    if self.release_year.class != Integer
      errors.add(:release_year, "This is not a valid year")
    elsif self.release_year >= 2018
      errors.add(:release_year, "The year must be in the past")
    end
  else
    true
  end
end

# def valid_year?
#   if self.released == true
#     if self.release_year >= 2018
#       errors.add(:release_year, "The release year must be in the past!")
#     else
#       true
#     end
#   end
# end
