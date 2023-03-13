require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "is valid with a name, price, quantity, and category" do
      @category = Category.create name: "Bushes"
      @product = Product.new(name: "name", price_cents: 1, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.create name: "Bushes"
      @product = Product.new(name: nil, price_cents: 1, quantity: 1, category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.create name: "Bushes"
      @product = Product.new(name: "name", price_cents: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.create name: "Bushes"
      @product = Product.new(name: "name", price_cents: 1, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.create name: "Bushes"
      @product = Product.new(name: "name", price_cents: 1, quantity: 1, category: nil)
      expect(@product).to_not be_valid
    end
  end
end
