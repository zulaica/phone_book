class Contact

  @@contacts = []

  attr_reader(:given_name, :middle_name, :surname, :nickname)

  define_method(:initialize) do |attributes|
    @given_name = attributes.fetch(:given_name)
    @middle_name = attributes.fetch(:middle_name)
    @surname = attributes.fetch(:surname)
    @nickname = attributes.fetch(:nickname)
  end

  define_method(:store) do
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

end
