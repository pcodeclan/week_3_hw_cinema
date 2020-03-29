require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1,$2) RETURNING id"
    values = [@title, @price]
    film_result = SqlRunner.run(sql, values).first
    @id = film_result['id'].to_i
  end

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE film_id = $1 ORDER BY (name, funds)"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    result = customer_data.map {|customer| Customer.new(customer)}
    p result
  end

  def Film.all()
    sql = "SELECT * FROM films"
    film_result = SqlRunner.run(sql)
    result = film_result.map {|film| Film.new(film)}
    return result
  end

  def Film.delete_all()
    sql = "DELETE from films"
    SqlRunner.run(sql)
  end

end
