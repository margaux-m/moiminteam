class Training < ApplicationRecord
  belongs_to :category
  has_many :results
  has_many :players, through: :results
end
