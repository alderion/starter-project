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
      :email => "value for email"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
