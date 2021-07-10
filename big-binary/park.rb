# Let's assume that we are building a ticketing system for a park. Right now there is only one rule. The adults will pay the full price and the young people, who are of age less than 18, will get a 20% discount on the price.

require 'date'

class Person
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def is_young
    age < 18
  end

  def is_adult
    (age >= 18) && (age < 60) ? true :false
  end

  def is_senior
    age > 60
  end
end

class Ticket
  FULL_PRICE = 20
  DISCOUNT_FOR_YOUNG = 20
  DISCOUNT_FOR_ADULT_ON_TUESDAY = 5
  DISCOUNT_FOR_SENIOR = 10
  DISCOUNT_FOR_YOUNG_IN_SUMMER = 10

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def price
    if person.is_young && is_june?
      new_price = discounted_price(DISCOUNT_FOR_YOUNG_IN_SUMMER)
    elsif person.is_adult && is_tuesday?
      new_price = discounted_price(DISCOUNT_FOR_ADULT_ON_TUESDAY)
    elsif person.is_young
      new_price = discounted_price(DISCOUNT_FOR_YOUNG)
    elsif person.is_senior
      new_price = discounted_price(DISCOUNT_FOR_SENIOR)
    end
  end

  private

  def discounted_price(discount)
    FULL_PRICE * (1 - (discount.to_f / 100))
  end

  def is_tuesday?
    Date.today.strftime('%A').downcase == 'tuesday'
  end

  def is_june?
    Date.today.strftime('%B').downcase == 'june'
  end

end

age = 64
person = Person.new(age)
ticket = Ticket.new(person)
puts "The price of ticket for a #{age} years old person will be #{ticket.price}"
