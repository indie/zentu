require 'spec_helper'

describe "nodes/edit" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :name => "MyString",
      :content => "MyText",
      :ancestry => "MyString"
    ))
  end

  it "renders the edit node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path(@node), :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "textarea#node_content", :name => "node[content]"
      assert_select "input#node_ancestry", :name => "node[ancestry]"
    end
  end
end
