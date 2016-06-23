require 'rails_helper'

describe "test" do
  it "is a basic test" do
    expect("Hello World").to eq("Hello World")
  end

  it "compares two numbers" do
    expect(2==2).to be(true)
  end
end
