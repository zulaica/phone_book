require("rspec")
require("contact")
require("phone")

describe("Phone") do

  before() do
    Phone.empty()
  end

  describe("#store") do
    it("creates a phone object, saving it and its attributes into the phone_numbers array.") do
      the_numbers = Phone.new({:type => "Home", :number => "(555) 555-5555", :contact_id => 0})
      the_numbers.store()
      expect(Phone.all()).to(eq([the_numbers]))
    end
  end

  describe("#find") do
    it("returns an array of phone numbers based on the contact_id") do
      phone1 = Phone.new({:type => "Home", :number => "(555) 555-5555", :contact_id => 0})
      phone2 = Phone.new({:type => "Work", :number => "(555) 555-5555", :contact_id => 0})
      phone3 = Phone.new({:type => "Home", :number => "(555) 555-5555", :contact_id => 1})
      phone4 = Phone.new({:type => "Mobile", :number => "(555) 555-5555", :contact_id => 0})
      phone1.store()
      phone2.store()
      phone3.store()
      phone4.store()
      expect(Phone.find(0)).to(eq([phone1, phone2, phone4]))
    end
  end

end
