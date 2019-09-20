
class Customer

  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # return array of all meals associated with this instance of customer
  def meals
    Meal.all.find_all {|meal| meal.customer == self }
  end

  # return array of all waiters that are/were associated with this customer instance 
  def waiters
    self.meals.map {|meal| meal.waiter}
  end


end
