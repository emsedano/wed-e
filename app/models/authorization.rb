class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uemail, :uid, :uname, :user_id, :weddy_id, :supplier_id

  belongs_to :user
  belongs_to :weddy
  belongs_to :supplier

end
