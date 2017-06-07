require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:cupcake) { Dessert.new("cupcake", 12, "Gordon")}
  let(:chef) { double("chef", name: "Gordon") }

  describe "#initialize" do
    it "sets a type" do
      expect(cupcake.type).to eq("cupcake")
    end

    it "sets a quantity" do
      expect(cupcake.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(cupcake.ingredients.size).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cupcake", "one-two", "Gordon") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cupcake.add_ingredient("sugar")
      expect(cupcake.ingredients.size).to eq(1)
    end
  end

  describe "#mix!" do
    let(:ingredients) { ["sugar", "spice", "cherry"]}

    it "shuffles the ingredient array" do
      cupcake.mix!
      expect(cupcake.ingredients).not_to eql(["sugar", "spice", "cherry"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cupcake.eat(4)
      expect(cupcake.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cupcake.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cupcake)
      cupcake.make_more
    end
  end
end
