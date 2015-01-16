require("rspec")
require("contact")

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
