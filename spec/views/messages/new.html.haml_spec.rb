require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :body => "MyString",
      :from_id => 1,
      :to_id => 1
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_body", :name => "message[body]"
      assert_select "input#message_from_id", :name => "message[from_id]"
      assert_select "input#message_to_id", :name => "message[to_id]"
    end
  end
end
