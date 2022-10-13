require 'pry'

class CashRegister

  attr_reader :discount, :items
  attr_accessor :total, :last_price

  def initialize discount=0
    @discount = discount
    @total = 0
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      self.items << title
    end
    self.last_price= price * quantity
    # PEMDAS
    # parenthesis - exponents - multiplication - division - addition - subtraction
    self.total = self.total + price * quantity
  end

  def apply_discount
    if self.discount > 0
      discount_amount = self.total * self.discount / 100.0
      self.total = self.total - discount_amount
      "After the discount, the total comes to $#{self.total.round}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    # binding.pry
    self.total= self.total - self.last_price
  end

  # def total
  #   @total
  # end

  # def total=(total)
  #   @total = total
  # end

end
