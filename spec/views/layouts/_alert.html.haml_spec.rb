require "spec_helper"

describe "Instant alerts" do
  subject { page }
  before(:each) { visit root_path }

  context "when none of the relevant variables are set" do
    before(:all) { ENV["ALERT"] = nil }

    it { should_not have_css "#instant.alert" }
  end

  context "when ALERT is set" do
    before(:all) { ENV["ALERT"] = "Test alert." }

    it { should have_css "#instant.alert.alert-info" }
    it { should have_css "#instant h4", text: "Notice" }
    it { should have_css "#instant p", text: "Test alert." }

    context "when ALERT_TYPE is set" do
      before(:all) { ENV["ALERT_TYPE"] = "error" }

      it { should have_css "#instant.alert.alert-error" }
    end

    context "when ALERT_TITLE is set" do
      before(:all) { ENV["ALERT_TITLE"] = "Test Title" }

      it { should have_css "#instant h4", text: "Test Title" }
    end
  end
end
