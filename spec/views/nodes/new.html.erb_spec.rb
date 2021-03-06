require 'spec_helper'

describe "nodes/new" do
  before(:each) do
    assign(:node, stub_model(Node,
      :name => "MyString",
      :content => "MyText",
      :ancestry => "MyString"
    ).as_new_record)
  end

  it "renders new node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path, :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "textarea#node_content", :name => "node[content]"
      assert_select "input#node_ancestry", :name => "node[ancestry]"
    end
  end
end
