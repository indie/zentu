# app/lib/calculator.rb

class Calculator
  def self.sum(a, b)
    a.to_i + b.to_i
  end

  def self.subtr(a, b)
    a.to_i - b.to_i
  end

  def self.mult(a, b)
  	a.to_i * b.to_i
  end

  def self.divide(a, b)
  	a.to_i / b.to_i
  end

  def self.percent(a)
  	a.to_i * 100
  end

end
