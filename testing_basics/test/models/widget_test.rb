require "test_helper"

describe Widget do
  let(:widget) { Widget.new }

  it "must be valid" do
    value(widget).must_be :valid?
  end
end
