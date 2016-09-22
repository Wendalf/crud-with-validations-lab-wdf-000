class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year], message: "cannot be repeated by the same artist in the same year"}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :release_year_custom

  def release_year_custom
    if released && !release_year.present?
      errors.add(:release_year, "can not be blank")
    elsif released && (release_year > Date.today.year)
      errors.add(:release_year, "can not be in the future")
    end
  end

  ###solution for release_year_custom

  # with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end

  # def released?
  #   released
  # end

end
