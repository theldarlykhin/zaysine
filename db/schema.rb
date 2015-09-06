# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150601064624) do

  create_table "admins", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "brands", force: true do |t|
    t.string   "brand_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "full_name"
    t.string   "location"
    t.string   "total_spent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "current_sign_in_ip"
    t.integer  "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "homes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "invoice_number"
    t.string   "customer_email"
    t.string   "item_name"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "random_id"
    t.string   "store_name"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_infos", force: true do |t|
    t.string   "name"
    t.string   "account_email"
    t.string   "customer_email"
    t.string   "storename"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "store_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "status",                 default: "unconfirm", null: false
    t.string   "approved",               default: "f",         null: false
  end

  add_index "merchants", ["approved"], name: "index_merchants_on_approved"
  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true
  add_index "merchants", ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true

  create_table "orders", force: true do |t|
    t.integer  "store_id"
    t.string   "customer_name"
    t.string   "customer_phone"
    t.string   "customer_email"
    t.string   "customer_city"
    t.string   "customer_township"
    t.string   "customer_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "purchase_item"
  end

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.string   "brand"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "store_id"
    t.string   "inventory"
    t.integer  "price"
    t.string   "inventory_policy"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "sku"
    t.string   "option_name"
    t.string   "option_value"
    t.text     "token"
    t.string   "page"
  end

  create_table "sellers", force: true do |t|
    t.string   "username_string"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_infos", force: true do |t|
    t.string   "full_name"
    t.string   "contact_number"
    t.string   "email"
    t.string   "city"
    t.string   "township"
    t.text     "shipping_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_rates", force: true do |t|
    t.string   "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amount"
    t.string   "paid_method"
    t.string   "store_id"
    t.string   "convenience_fee"
    t.string   "amount_for_convenience_fee"
    t.string   "paidmethod_for_convenience_fee"
  end

  create_table "standardformats", force: true do |t|
    t.string   "timezone"
    t.string   "currency"
    t.string   "unitsystemstring"
    t.string   "defaultweightunit"
    t.string   "prefix"
    t.string   "suffix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "store_desc"
    t.integer  "merchant_id"
    t.string   "owner_name"
    t.string   "customer_email"
  end

end
