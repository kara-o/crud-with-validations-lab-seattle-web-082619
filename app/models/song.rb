class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: Proc.new { |c| c.released? }
  validates :release_year, numericality: { less_than: Time.now.year }, if: Proc.new { |c| c.released? }
  validates :artist_name, presence: true

end
