class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness:{ scope: [:artist_name,:release_year]}
  validates :released, inclusion: {in:[true, false]}, exclusion:{ in:[nil]}
  validates :artist_name, presence:true
  validates :release_year, if: :released? , numericality:{only_integer: true, allow_nil:true, less_than_or_equal_to: Time.now.year}

end
