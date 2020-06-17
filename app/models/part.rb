class Part < ApplicationRecord
  validates :part_number, :date_added, :description, :condition, :price_min, :cost_min, :order_min, :available, :quote_type, :tag,  presence: true
  validates_numericality_of :available, :order_min, :price_min, :cost_min, greater_than: 0
  validates_numericality_of :order_med, :order_max, :cost_med, :cost_max, :price_med, :price_max, greater_than_or_equal_to: 0, allow_nil: true
  validates_numericality_of :order_min, less_than_or_equal_to: :available, unless: -> { available.nil? || available == 0 }
  before_save :upcase_fields

  private

  def upcase_fields
    self.part_number = self.part_number.upcase
    self.description = self.description.upcase
    self.condition = self.condition.upcase
    self.quote_type = self.quote_type.upcase
    self.tag = self.tag.upcase
  end
end
