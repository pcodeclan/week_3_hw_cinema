require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :cust_funds, :film_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

    @cust_funds = options['cust_funds'].to_i
    @film_price = options['film_price'].to_i
    @cust_fund_total = options['cust_fund_total'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id,film_id) VALUES ($1,$2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    return Film.new(film)
  end


  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql, values)
    result = tickets.map{|ticket_hash|self.new(ticket_hash)}
    return result
  end

  #Get customer funds
  def get_cust_funds()
    sql = "SELECT funds FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first #At this step, still a hash
    @cust_funds = Customer.new(customer).funds #This step, you are telling terminal to use the Get funds method in Customer class.
  end

  #Get film price
  def get_film_price()
    sql = "SELECT price from films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    @film_price = Film.new(film).price #Method for films is price
  end

  def cust_buys_ticket()
    @cust_fund_total = get_cust_funds()-get_film_price() #Calculation works
    sql = "UPDATE customers
          SET funds = $2 WHERE id = $1"
    values = [@cust_funds_total, @customer_id]
    SqlRunner.run(sql, values)
  end

end
