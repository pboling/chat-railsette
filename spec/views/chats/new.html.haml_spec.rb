require 'spec_helper'

describe "chats/new" do
  before(:each) do
    assign(:chat, stub_model(Chat).as_new_record)
  end

  it "renders new chat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => chats_path, :method => "post" do
    end
  end
end
