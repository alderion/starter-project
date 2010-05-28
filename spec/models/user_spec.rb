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

require 'spec_helper'

describe User do
  before(:each) do
    @valida = {
      :fname => "value for fname",
      :lname => "value for lname",
      :email => "user+ext@machine.domain.com"
    }
    @validu = User.new @valida
    @validu.password = "password"
    @validu.password_confirmation = "password"
  end

  it "should save a new instance given valid attributes" do
    @validu.save!
  end

  it "should require an email" do
    no_email_user = User.new(@valida.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should allow valid emails" do
    addresses = %w[user+ext@domain.com user-ext@machine.domain.com user.foo@domain.com]
    addresses.each do |a|
      u = @validu
      u.email = a
      u.should be_valid
    end
  end

  it "should reject invalid emails" do
    addresses = %w[user+ext@domain,com machine.domain.com user.foo@machine.domain.]
    addresses.each do |a|
      u = @validu
      u.email = a
      u.should_not be_valid
    end
  end

  it "should reject duplicate emails" do
    @validu.save!
    u = User.new(@valida)
    u.password = "password"
    u.password_confirmation = "password"
    u.should_not be_valid
  end

  it "should reject matching mixed case emails" do
    @validu.save!
    u = User.new(@valida)
    u.password = "password"
    u.password_confirmation = "password"
    u.email = @valida[:email].upcase
    u.should_not be_valid
  end


end
