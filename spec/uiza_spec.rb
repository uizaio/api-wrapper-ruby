require "spec_helper"

RSpec.describe Uiza do
  it "should has a version number" do
    expect(Uiza::VERSION).not_to be nil
  end

  it "should allows app_id to be configured" do
    Uiza.app_id = "your-app-id"

    expect(Uiza.app_id).to eq "your-app-id"
  end

 it "should allows authorization to be configured" do
    Uiza.authorization = "your-authorization"

    expect(Uiza.authorization).to eq "your-authorization"
  end
end
