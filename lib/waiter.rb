require "pry"
require 'pry-moves'

class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []


  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  # find all meals associated with this instance of waiter
  def meals
    Meal.all.find_all {|meal| meal.waiter == self }
  end

  # find the best tipper out of this waiter instance customers
  def best_tipper

    max_tip = 0
    best_tipper = nil

    meals.each do |meal|
      if meal.tip > max_tip
        max_tip = meal.tip
        best_tipper = meal.customer
      end
    end

    # this is much more elegant way, taken from the solution afterwards
    # best_tipped_meal = meals.max {|a, b| a.tip <=> b.tip}
    # best_tipped_meal.customer

    best_tipper
  end

end
