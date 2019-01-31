class Season < ApplicationRecord
  # Must include Conceivable before Review/Viewable to avoid ActiveRecord::HasManyThroughOrderError
  include Conceivable
  include Viewable
  include Reviewable
  belongs_to :series
  has_many :episodes
  before_validation :build_parents
  validates :series, presence: true
  validates :number, presence: true

  def title
    "#{series.title} - Season #{number}"
  end
end
