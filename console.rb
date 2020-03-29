require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Arnold Clark', 'funds' => '30'})
customer1.save()

customer2 = Customer.new({'name' => 'James Coburn', 'funds' => '20'})
customer2.save()
customer3 = Customer.new({'name' => 'David Williams', 'funds' => '40'})
customer3.save()
customer4 = Customer.new({'name' => 'Clark Kent', 'funds' => '25'})
customer4.save()
customer5 = Customer.new({'name' => 'Benedict Cook', 'funds' => '35'})
customer5.save()
customer6 = Customer.new({'name' => 'Egbert Robins', 'funds' => '30'})
customer6.save()

film1 = Film.new ({'title' => 'Spiderman', 'price' => '10'})
film1.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket1.cust_buys_ticket()
#ticket1.get_cust_funds()
#ticket1.get_film_price()
#ticket1.customer()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film1.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film1.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer6.id, 'film_id' => film1.id})
ticket6.save()

# Returns how many customers went to see a certain film
film1.customers()

#Returns how many films a specific customer saw
customer1.films()

binding.pry
nil
