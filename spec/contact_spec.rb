require("rspec")
require("contact")
require("phone")

describe("Contact") do
  before() do
    Contact.empty()
  end

  describe("#store") do
    it("creates a new contact object, saving it and its attributes into the contacts array.") do
      the_contact = Contact.new({:given_name => "David", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      the_contact.store()
      expect(Contact.all()).to(eq([the_contact]))
    end
  end

  describe("#store") do
    it("also adds a unique ID automatically when a contact is stored.") do
      the_contact = Contact.new({:given_name => "David", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      the_contact.store()
      expect(the_contact.id()).to(eq(0))
    end
  end

  describe("#add_numbers") do
    it("adds the supplied phone numbers to the contact.") do
      the_contact = Contact.new({:given_name => "David", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      the_contact.store()
      the_numbers = Phone.new({:home_phone => "(555) 555-5555", :work_phone => "(555) 555-5555", :mobile_phone => "(555) 555-5555", :other_phone => "(555) 555-5555"})
      the_contact.add_numbers(the_numbers)
      expect(the_contact.numbers()).to(eq(the_numbers))
    end
  end

  describe(".empty") do
    it("removes all contact objects from the contacts array.") do
      the_contact = Contact.new({:given_name => "David", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      the_contact.store()
      Contact.empty()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a contact by its ID number") do
      the_contact = Contact.new({:given_name => "David", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      the_contact.store()
      other_contact = Contact.new({:given_name => "Michael", :middle_name => "Anthony", :surname => "Zulaica", :nickname => ""})
      other_contact.store()
      expect(Contact.find(the_contact.id())).to(eq(the_contact))
    end
  end

end
