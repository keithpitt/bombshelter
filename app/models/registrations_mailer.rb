class RegistrationsMailer < ActionMailer::Base
  def admin(registration, attendent_types)
      recipients     'info@bombsheltermagic.com'
      subject        'Bombshelter Magic - New Online Registration'
      from           'info@bombsheltermagic.com'
      body           :registration => registration, :attendent_types => attendent_types
      content_type   'text/html'
  end

  def public(registration)
    recipients        registration.email
    subject           'Adelaide Magic Convention - 2008'
    from              'info@bombsheltermagic.com'
    content_type      'text/html'
  end
end
