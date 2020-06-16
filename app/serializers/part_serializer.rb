class PartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :part_number, :owner, :date_added, :description, :available, :reserved, :sold,
             :condition, :cost_min, :price_min, :order_min, :cost_med, :price_med, :order_med, :cost_max, :price_max,
             :order_max, :lead_time, :quote_type, :tag
end
