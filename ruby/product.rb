class Product
    attr :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    def format_price
        "£#{price}"
    end
end

lamp = Product.new("Lamp", 25.99)

puts lamp.name
puts lamp.format_price
