class Contact

  @@contacts = []

  attr_reader(:id, :given_name, :middle_name, :surname, :nickname)

  define_method(:initialize) do |attributes|
    @given_name = attributes.fetch(:given_name)
    @middle_name = attributes.fetch(:middle_name)
    @surname = attributes.fetch(:surname)
    @nickname = attributes.fetch(:nickname)
  end

  define_method(:store) do
    if @@contacts == []
      @id = 0
    else
      @id = @@contacts.last().id().+(1)
    end
    @@contacts.push(self)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:empty) do
    @@contacts = []
  end

end
