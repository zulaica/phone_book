require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/contact")
require("./lib/phone")

get("/") do
  @contacts = Contact.all()
  erb(:index)
end

post("/") do
  @given_name = params.fetch("given_name")
  @middle_name = params.fetch("middle_name")
  @surname = params.fetch("surname")
  @nickname = params.fetch("nickname")

  @home_phone = params.fetch("home_phone")
  @work_phone = params.fetch("work_phone")
  @mobile_phone = params.fetch("mobile_phone")
  @other_phone = params.fetch("other_phone")

  the_contact = Contact.new({:given_name => @given_name, :middle_name => @middle_name, :surname => @surname, :nickname => @nickname})
  the_numbers = Phone.new({:home_phone => @home_phone, :work_phone => @work_phone, :mobile_phone => @mobile_phone, :other_phone => @other_phone})
  the_contact.store(the_numbers)

  redirect('/')
end

get("/contact/:id") do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end
