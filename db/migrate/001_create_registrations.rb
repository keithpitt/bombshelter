class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|

      t.string  :full_name, :address_1, :address_2, 
                :city, :state, :post_code,
                :phone_number, :mobile_number, :email,
                :website

      t.boolean :amc_mailing_list

      t.string :attendee_1, :attendee_1_type, :attendee_1_competitions
      t.float :attendee_1_price

      t.string :attendee_2, :attendee_2_type, :attendee_2_competitions
      t.float :attendee_2_price

      t.string :attendee_3, :attendee_3_type, :attendee_3_competitions
      t.float :attendee_3_price

      t.string :attendee_4, :attendee_4_type, :attendee_4_competitions
      t.float :attendee_4_price

      t.string :attendee_5, :attendee_5_type, :attendee_5_competitions
      t.float :attendee_5_price

      t.string :attendee_6, :attendee_6_type, :attendee_6_competitions
      t.float :attendee_6_price

      t.float :total

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
