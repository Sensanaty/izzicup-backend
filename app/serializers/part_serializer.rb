class PartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :part_number, :owner, :description, :available, :reserved, :sold,
             :condition, :cost_min, :price_min, :order_min, :cost_med, :price_med, :order_med, :cost_max, :price_max,
             :order_max, :lead_time, :quote_type, :tag
  attribute :formatted_date_added do |object|
    object.date_added.strftime("%d/%m/%Y")
  end
end
