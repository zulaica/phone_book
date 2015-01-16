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

  the_contact = Contact.new({:given_name => @given_name, :middle_name => @middle_name, :surname => @surname, :nickname => @nickname})
  the_contact.store()

  redirect('/')
end

get("/contact/:id") do
  @contact = Contact.find(params.fetch("id"))
  erb(:contact)
end
