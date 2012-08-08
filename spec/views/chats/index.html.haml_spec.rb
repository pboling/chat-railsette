require 'spec_helper'

describe "chats/index" do
  before(:each) do
    assign(:chats, [
      stub_model(Chat),
      stub_model(Chat)
    ])
  end

  it "renders a list of chats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
