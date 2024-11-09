class Patient < ApplicationRecord
  validates :name, :age, :gender, :phone, presence: true
end
