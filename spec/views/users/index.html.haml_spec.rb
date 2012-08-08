require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name"
      ),
      stub_model(User,
        :name => "Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "ul>li", :text => "Name".to_s, :count => 2
  end
end
