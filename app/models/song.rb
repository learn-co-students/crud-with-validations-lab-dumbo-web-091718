class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year}
  
  with_options if: :released do |song|
     song.validates :release_year, presence: true
     song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
   end

end

 # Song is invalid without release year when released is true
# Song is invalid when the release year is in the future
