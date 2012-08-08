require 'spec_helper'

describe User do
  it "can be saved successfully" do
    User.create.should be_persisted
  end
end
