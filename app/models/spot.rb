class Spot < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  #validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

end
