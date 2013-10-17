class Admin::LocationsController < Admin::ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index

  end
end

__END__
- Paste monthly schedule
- Enter up to 5 messages
- Enter masjid information
  - Name
  - Address (coordinates)
  - Phone number
  - Logo

- Manage users able to edit information on site.
