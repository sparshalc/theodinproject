class Content < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :global_search, against: %i[body], using: { tsearch: { prefix: true } }

  belongs_to :lesson

  validates :body, presence: true
end
