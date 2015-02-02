class Phone

  @@phone_numbers = []

  attr_reader(:type, :number, :contact_id)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @number = attributes.fetch(:number)
    @contact_id = attributes.fetch(:contact_id)
  end

  define_method(:store) do
    @@phone_numbers.push(self)
  end

  define_singleton_method(:all) do
    @@phone_numbers
  end

  define_singleton_method(:empty) do
    @@phone_numbers = []
  end

  define_singleton_method(:find) do |identification|
    found_numbers = []
    @@phone_numbers.each() do |phone_number|
      if phone_number.contact_id().eql?(identification.to_i())
        found_numbers.push(phone_number)
      end
    end
    found_numbers
  end

end
