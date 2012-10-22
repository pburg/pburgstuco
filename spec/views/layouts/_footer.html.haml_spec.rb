require "spec_helper"

require "net/http"

describe "Footer" do
  subject { page }

  describe "version link" do
    before(:each) { visit root_path }

    it { should have_link File.read(Rails.root.join "VERSION").strip }

    it "links to the change log on GitHub" do
      # Prevent an ambiguous match by only checking the one inside of the
      # div.hidden-phone.
      uri = URI.parse find(".hidden-phone .version")[:href]

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = http.request(Net::HTTP::Get.new uri.request_uri)
      response.kind_of?(Net::HTTPSuccess).should be_true
    end

    it "has a special label on the public development server" do
      set_development_server
      visit root_path

      should have_css "#footer .left", text: " - Development Server"
    end
  end

  describe "center content" do
    it "has a copyright on the production server" do
      set_production_server
      visit root_path

      should have_css "#footer", text: "Copyright"
    end

    it "has a prompt to lauch production on the public development server" do
      set_development_server
      visit root_path

      should have_link "Launch Production"
    end

    it "has development/production server launch options during development" do
      Rails.env = "development"
      visit root_path

      should have_css "#footer", text: "Launch: Development | Production"
    end
  end
end
