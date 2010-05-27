# == Schema Information
# Schema version: 20100527193910
#
# Table name: users
#
#  id         :integer         not null, primary key
#  fname      :string(255)
#  lname      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :fname => "value for fname",
      :lname => "value for lname",
      :email => "user+ext@machine.domain.com"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "should require an email" do
    no_email_user = User.new(@valid_attributes.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should allow valid emails" do
    addresses = %w[user+ext@domain.com user-ext@machine.domain.com user.foo@machine.domain]
    addresses.each do |a|
      u = User.new(@valid_attributes.merge(:email => a))
      u.should be_valid
    end
  end

  it "should reject invalid emails" do
    addresses = %w[user+ext@domain,com machine.domain.com user.foo@machine.domain.]
    addresses.each do |a|
      u = User.new(@valid_attributes.merge(:email => a))
      u.should_not be_valid
    end
  end

  it "should reject duplicate emails" do
    User.create!(@valid_attributes)
    u = User.new(@valid_attributes)
    u.should_not be_valid
  end

  it "should reject matching mixed case emails" do
    email = @valid_attributes[:email].upcase
    User.create!(@valid_attributes.merge(:email => email))
    u = User.new(@valid_attributes)
    u.should_not be_valid
  end
end
