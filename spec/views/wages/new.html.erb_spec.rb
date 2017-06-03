require 'rails_helper'

RSpec.describe "wages/new", type: :view do
  before(:each) do
    assign(:wage, Wage.new(
      :hourly_rate => 1
    ))
  end

  it "renders new wage form" do
    render

    assert_select "form[action=?][method=?]", wages_path, "post" do

      assert_select "input#wage_hourly_rate[name=?]", "wage[hourly_rate]"
    end
  end
end
