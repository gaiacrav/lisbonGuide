class Spot < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true
  #validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

end
