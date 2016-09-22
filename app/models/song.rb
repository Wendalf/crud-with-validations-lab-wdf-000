class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
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
  
end
