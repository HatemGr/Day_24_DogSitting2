class Dog < ApplicationRecord
  has_and_belongs_to_many :strolls
  has_many :dogsitters, through: :strolls
  belongs_to :city

end
