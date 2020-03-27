require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Arnold Clark', 'funds' => '30'})
customer1.save()

film1 = Film.new ({'title' => 'Spiderman', 'price' => '10'})
film1.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

# Returns how many customers went to see a certain film
film1.customers()

#Returns how many films a specific customer saw
customer1.films()

binding.pry
nil
