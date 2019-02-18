require "spec_helper"

RSpec.describe Uiza do
  it "should has a version number" do
    expect(Uiza::VERSION).not_to be nil
  end

  it "should allows workspace_api_domain to be configured" do
    Uiza.workspace_api_domain = "your-workspace-api-domain"

    expect(Uiza.workspace_api_domain).to eq "your-workspace-api-domain"
  end

 it "should allows authorization to be configured" do
    Uiza.authorization = "your-authorization"

    expect(Uiza.authorization).to eq "your-authorization"
  end
end
