require "spec_helper"

describe "Navigation bar" do
  subject { page }

  NAV_LINKS = %w[Home Members Events Photos Downloads Constitution]

  describe "nav links" do
    before(:each) { visit root_path }

    NAV_LINKS.each do |nav|
      it { should have_css "ul.nav > li > a", text: nav }
    end
  end

  describe "active navigation link" do
    NAV_LINKS.each do |nav|
      it "shows the '#{nav}' link as active" do
        visit "/#{nav.downcase}"
        should have_css "ul.nav > li.active > a", text: nav
      end
    end
  end
end
