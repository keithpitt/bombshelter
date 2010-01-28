class Registration < ActiveRecord::Base

  validates_presence_of 	:full_name, :address_1,	:city, :state, :post_code,
						  	:phone_number, :email, :attendee_1

  def update_prices (prices)

	  total_accum = 0

	  6.times do |i|
		i = i + 1

		if self['attendee_' + i.to_s] != ''

			type = self['attendee_' + i.to_s + '_type']

			if type == "M"
				price = prices[:M]
			elsif type == "SP"
				price = prices[:SP]
			elsif type == "J"
				price = prices[:J]
			elsif type == "SA"
				price = prices[:SA]
			elsif type == "SU"
				price = prices[:SU]
			elsif type == "B"
				price = prices[:B]
			end

			self['attendee_' + i.to_s + '_price'] = price

			total_accum += price

		end

	  end

	  self.total = total_accum
	  save!

  end

  def finalize! attendent_types
    RegistrationsMailer.deliver_admin ( self, attendent_types )
    RegistrationsMailer.deliver_public self 
  end

  def total_cents
	(total * 100).to_i
  end

end
