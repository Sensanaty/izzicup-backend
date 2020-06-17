require 'rails_helper'

RSpec.describe Part, type: :model do
  let(:part) { Part.new(part_number: "174097-85",
                        date_added: DateTime.current,
                        description: "MASK",
                        available: 250,
                        condition: "NE",
                        price_min: 28000,
                        cost_min: 25000,
                        order_min: 10,
                        quote_type: "OUTRIGHT SALE",
                        tag: "MFR 8130/TRACE; STOCK USA **MOQ=10EA**") }

  context 'basic checks' do
    it 'is valid with proper attributes' do
      expect(part).to be_valid
    end

    it 'is valid without a Owner' do
      part.owner = ''
      expect(part).to be_valid
    end

    it 'is valid without a Reserved' do
      part.reserved = 0
      expect(part).to be_valid
    end

    it 'is valid without a Sold' do
      part.sold = 0
      expect(part).to be_valid
    end

    it 'is valid without a Cost Medium' do
      part.cost_med = nil
      expect(part).to be_valid
    end

    it 'is valid without a Price Medium' do
      part.price_med = nil
      expect(part).to be_valid
    end

    it 'is valid without a Order Medium' do
      part.order_med = nil
      expect(part).to be_valid
    end

    it 'is valid without a Cost Max' do
      part.cost_max = nil
      expect(part).to be_valid
    end

    it 'is valid without a Price Max' do
      part.price_max = nil
      expect(part).to be_valid
    end

    it 'is valid without a Order Max' do
      part.order_max = nil
      expect(part).to be_valid
    end

    it 'is valid without a Lead Time' do
      part.lead_time = nil
      expect(part).to be_valid
    end

    it 'is not valid without a Part Number' do
      part.part_number = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Date Added' do
      part.date_added = nil
      expect(part).to_not be_valid
    end

    it 'is not valid without a Description' do
      part.description = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Quantity Available' do
      part.available = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Condition' do
      part.condition = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Price Minimum' do
      part.price_min = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Cost Minimum' do
      part.cost_min = nil
      expect(part).to_not be_valid
    end

    it 'is not valid without a Minimum Order' do
      part.order_min = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Quote Type' do
      part.quote_type = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Tag' do
      part.tag = ''
      expect(part).to_not be_valid
    end

  end

  context 'validations' do

    context 'strings' do
      it "Part Number must be all caps" do
        part.part_number = "abcdefg123456"
        part.save
        expect(part.part_number).to eq(part.part_number.upcase), "Expected #{part.part_number.upcase}, instead got #{part.part_number}"
      end

      it 'Description must be all caps' do
        part.description = "mask"
        part.save
        expect(part.description).to eq(part.description.upcase), "Expected #{part.description.upcase}, instead got #{part.description}"
      end

      it 'Condition must be all caps' do
        part.condition = "ne"
        part.save
        expect(part.condition).to eq(part.condition.upcase), "Expected #{part.condition.upcase}, instead got #{part.condition}"
      end

      it 'Quote Type must be all caps' do
        part.quote_type = "mask"
        part.save
        expect(part.quote_type).to eq(part.quote_type.upcase), "Expected #{part.quote_type.upcase}, instead got #{part.quote_type}"
      end

      it 'Tag must be all caps' do
        part.tag = "mask"
        part.save
        expect(part.tag).to eq(part.tag.upcase), "Expected #{part.tag.upcase}, instead got #{part.tag}"
      end
    end

    context "integers" do

      it 'Available cannot be 0 or negative' do
        part.available = 0
        expect(part).to_not be_valid, "Quantity Available cannot be 0"

        part.available = -1
        expect(part).to_not be_valid, "Quantity Available cannot be less than 0"
      end

      it 'Order Minimum cannot be 0 or negative' do
        part.order_min = 0
        expect(part).to_not be_valid, "Order Minimum cannot be 0"

        part.order_min = -1
        expect(part).to_not be_valid, "Order Minimum cannot be less than 0"
      end

      it 'Cost Minimum cannot be 0 or negative' do
        part.cost_min = 0
        expect(part).to_not be_valid, " cannot be 0"

        part.cost_min = -1
        expect(part).to_not be_valid, " cannot be less than 0"
      end

      it 'Price Minimum cannot be 0 or negative' do
        part.price_min = 0
        expect(part).to_not be_valid, " cannot be 0"

        part.price_min = -1
        expect(part).to_not be_valid, " cannot be less than 0"
      end

      it 'Orders Medium and Maximum cannot be less than 0' do
        part.order_med = -1
        expect(part).to_not be_valid, "Order Medium cannot be less than 0"

        part.order_max = -1
        expect(part).to_not be_valid, "Order Maximum cannot be less than 0"
      end

      it 'Price Medium and Maximum cannot be less than 0' do
        part.price_med = -1
        expect(part).to_not be_valid, "Price Medium cannot be less than 0"

        part.price_max = -1
        expect(part).to_not be_valid, "Price Maximum cannot be less than 0"
      end

      it 'Cost Medium and Maximum cannot be less than 0' do
        part.cost_med = -1
        expect(part).to_not be_valid, "Cost Medium cannot be less than 0"

        part.cost_max = -1
        expect(part).to_not be_valid, "Cost Maximum cannot be less than 0"
      end

      it 'Minimum Order cannot be larger than Quantity Available' do
        part.available = 1
        part.order_min = 2

        expect(part).to_not be_valid, "There must be more available than the minimum order"
      end

    end

  end
end