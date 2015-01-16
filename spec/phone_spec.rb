require("rspec")
require("contact")
require("phone")

describe("Phone") do

  describe("#store") do
    it("creates a phone object and stores it into the associated Contact object.") do
      the_numbers = Phone.new({:home_phone => "(555) 555-5555", :work_phone => "(555) 555-5555", :mobile_phone => "(555) 555-5555", :other_phone => "(555) 555-5555"})
      the_numbers.store()
      expect(Phone.all()).to(eq([the_numbers]))
    end
  end

end
