# == Schema Information
# Schema version: 20100527202451
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  fname              :string(255)
#  lname              :string(255)
#  email              :string(255)
#  crypted_password   :string(255)
#  password_salt      :string(255)
#  persistence_token  :string(255)
#  login_count        :integer
#  failed_login_count :integer
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :fname, :lname, :email

  validates_presence_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :email, :case_sensitive => false
end
