require 'spec_helper'

describe User do

  it "can be instantiated" do
    build(:mary).should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    create(:mary).should be_persisted
  end

  it "can be instantiated with a name" do
    build(:mary, {:name => 'John'}).name.should == 'John'
  end

  it "can be instantiated without a name" do
    build(:mary, {:name => nil}).name.should == nil
  end

  it "validates name on save" do
    lambda {create(:mary, {:name => nil})}.should raise_error ActiveRecord::RecordInvalid
  end

end
