# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "registrations", :force => true do |t|
    t.string   "full_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "post_code"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "email"
    t.string   "website"
    t.boolean  "amc_mailing_list"
    t.string   "attendee_1"
    t.string   "attendee_1_type"
    t.string   "attendee_1_competitions"
    t.float    "attendee_1_price"
    t.string   "attendee_2"
    t.string   "attendee_2_type"
    t.string   "attendee_2_competitions"
    t.float    "attendee_2_price"
    t.string   "attendee_3"
    t.string   "attendee_3_type"
    t.string   "attendee_3_competitions"
    t.float    "attendee_3_price"
    t.string   "attendee_4"
    t.string   "attendee_4_type"
    t.string   "attendee_4_competitions"
    t.float    "attendee_4_price"
    t.string   "attendee_5"
    t.string   "attendee_5_type"
    t.string   "attendee_5_competitions"
    t.float    "attendee_5_price"
    t.string   "attendee_6"
    t.string   "attendee_6_type"
    t.string   "attendee_6_competitions"
    t.float    "attendee_6_price"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
