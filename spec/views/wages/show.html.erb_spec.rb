require 'rails_helper'

RSpec.describe "wages/show", type: :view do
  before(:each) do
    @wage = assign(:wage, Wage.create!(
      :hourly_rate => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
