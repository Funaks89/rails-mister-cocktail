class Ingredient < ApplicationRecord
  has_many :doses
  # before_destroy :check

  validates :name, presence: true, uniqueness: true

  # def check
  #   if !self.doses.empty
  #     raise StandardError.new "This is an exception"
  #   end
  # end

end
