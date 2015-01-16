class Phone

  @@phone_numbers = []

  attr_reader(:home_phone, :work_phone, :mobile_phone, :other_phone)

  define_method(:initialize) do |attributes|
    @home_phone = attributes.fetch(:home_phone)
    @work_phone = attributes.fetch(:work_phone)
    @mobile_phone = attributes.fetch(:mobile_phone)
    @other_phone = attributes.fetch(:other_phone)
  end

  define_method(:store) do
    @@phone_numbers.push(self)
  end

  define_singleton_method(:all) do
    @@phone_numbers
  end

end
