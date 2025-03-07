class Waiter
 attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience 
    @@all << self
  end

  def self.all 
    @@all 
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end

  def best_tipper
    meals.sort_by{|meal| meal.tip}.last.customer
  end
end