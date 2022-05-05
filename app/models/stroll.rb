class Stroll < ApplicationRecord
  has_and_belongs_to_many :dogs
  belongs_to :dogsitter
end
