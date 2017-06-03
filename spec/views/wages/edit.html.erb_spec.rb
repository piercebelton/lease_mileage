require 'rails_helper'

RSpec.describe "wages/edit", type: :view do
  before(:each) do
    @wage = assign(:wage, Wage.create!(
      :hourly_rate => 1
    ))
  end

  it "renders the edit wage form" do
    render

    assert_select "form[action=?][method=?]", wage_path(@wage), "post" do

      assert_select "input#wage_hourly_rate[name=?]", "wage[hourly_rate]"
    end
  end
end
