class Product < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, against: [:name, :company, :product, :industry, :hs_code]
end
