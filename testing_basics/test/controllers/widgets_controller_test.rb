require "test_helper"

describe WidgetsController do
  let(:widget) { widgets :one }

  it "gets index" do
    get widgets_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_widget_url
    value(response).must_be :success?
  end

  it "creates widget" do
    expect {
      post widgets_url, params: { widget: { name: widget.name } }
    }.must_change "Widget.count"

    must_redirect_to widget_path(Widget.last)
  end

  it "shows widget" do
    get widget_url(widget)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_widget_url(widget)
    value(response).must_be :success?
  end

  it "updates widget" do
    patch widget_url(widget), params: { widget: { name: widget.name } }
    must_redirect_to widget_path(widget)
  end

  it "destroys widget" do
    expect {
      delete widget_url(widget)
    }.must_change "Widget.count", -1

    must_redirect_to widgets_path
  end
end
