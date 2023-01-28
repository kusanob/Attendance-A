class Bace < ApplicationRecord
  validates :bace_number, presence: true, length: { maximum: 3 }
  validates :bace_name, presence: true, length: { maximum: 5 }
  validates :bace_type, presence: true, length: { maximum: 5 }
end
