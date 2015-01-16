class Contact

  @@contacts = []

  attr_reader(:id, :given_name, :middle_name, :surname, :nickname, :numbers)

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

  define_method(:add_numbers) do |the_numbers|
    @numbers = the_numbers
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:empty) do
    @@contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(identification.to_i())
        found_contact = contact
      end
    end
    found_contact
  end

end
