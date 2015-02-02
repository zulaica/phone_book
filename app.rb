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
  the_contact.store()
  @contact_id = the_contact.id().to_i()
  if @home_phone != ""
    home_phone = Phone.new({:type => "Home", :number => @home_phone, :contact_id => @contact_id})
    home_phone.store()
  end
  if @work_phone != ""
    work_phone = Phone.new({:type => "Work", :number => @work_phone, :contact_id => @contact_id})
    work_phone.store()
  end
  if @mobile_phone != ""
    mobile_phone = Phone.new({:type => "Mobile", :number => @mobile_phone, :contact_id => @contact_id})
    mobile_phone.store()
  end
  if @other_phone != ""
    other_phone = Phone.new({:type => "Other", :number => @other_phone, :contact_id => @contact_id})
    other_phone.store()
  end
  
  redirect('/')
end

get("/contact/:id") do
  @contact = Contact.find(params.fetch("id"))
  @numbers = Phone.find(params.fetch("id"))
  erb(:contact)
end
