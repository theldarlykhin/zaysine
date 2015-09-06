# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




brand = Brand.create([

{brand_name: "Giordano"},
{brand_name: "Bossini"},
{brand_name: "Yoo Club"},

])

category = Category.create([

{category_name: "T-shirt"},
{category_name: "S-shirt"},
{category_name: "Pants"},

])



admin = Admin.create([

{email: "htoomyatag.webdev@gmail.com", password: "privatehma", password_confirmation: "privatehma"},
{email: "theldarlykhin.webdev@gmail.com", password: "privatethel", password_confirmation: "privatethel"},
{email: "nc.nyeinchan@gmail.com", password: "privatenc", password_confirmation: "privatenc"}
])

customer = Customer.create([

{email: "aokcustomer@gmail.com", password: "privatehma", password_confirmation: "privatehma"},

])


merchant = Merchant.create([

{approved:"t",email: "merchant001@gmail.com", password: "private001", password_confirmation: "private001"},
{email: "merchant002@gmail.com", password: "private002", password_confirmation: "private002"},
{email: "merchant003@gmail.com", password: "private003", password_confirmation: "private003"},
{email: "merchant004@gmail.com", password: "private004", password_confirmation: "private004"}


])

customer = Customer.create([

{email: "htoomyatag1.webdev@gmail.com", password: "privatehma", password_confirmation: "privatehma",full_name:"aokcustomer", location:"yangon", total_spent:"50000"},
{email: "htoomyatag2.webdev@gmail.com", password: "privatehma", password_confirmation: "privatehma",full_name:"bokcustomer", location:"mandalay", total_spent:"70000"},
{email: "htoomyatag3.webdev@gmail.com", password: "privatehma", password_confirmation: "privatehma",full_name:"cokcustomer", location:"myitkyinar", total_spent:"40000"},
{email: "htoomyatag4.webdev@gmail.com", password: "privatehma", password_confirmation: "privatehma",full_name:"dokcustomer", location:"mawlamyine", total_spent:"60000"}
])

store = Store.create([

{name: "store1", merchant_id: "1"}

])

product = Product.create([

{
	product_name: "Giordano T-shirt",
    desc: "just shirt",
    category_id: "1",
    brand_id: "1",
    store_id: "1",
    price: "25000 MMk"

},

{
	product_name: "Hangten T-shirt",
    desc: "just shirt",
    category_id: "1",
    brand_id: "1",
    store_id: "1",
    price: "35000 MMk"

},


{
	product_name: "Pieer Cardin",
    desc: "just shirt",
    category_id: "1",
    brand_id: "1",
    store_id: "1",
    price: "90000 MMk"

}

])

invoice = Invoice.create([

    {invoice_number: "54321",customer_email: "htoomyatag2.webdev@gmail.com",item_name: "alpine",price: "13000"},
    {invoice_number: "54322",customer_email: "theldarlykhin.webdev@gmail.com",item_name: "Giordano",price: "15000"},
    {invoice_number: "54323",customer_email: "thel@gmail.com",item_name: "Next",price: "9000"}


     

])



