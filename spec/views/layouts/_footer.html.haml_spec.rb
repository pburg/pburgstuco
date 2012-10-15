require "spec_helper"

require "net/http"

describe "Footer" do
  subject { page }
  before(:each) { visit root_path }

  let(:version) { File.read(Rails.root.join "VERSION").strip }

  it { should have_link version }

  it "links to the change log on GitHub" do
    uri = URI.parse find_link(version)[:href]

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    response = http.request(Net::HTTP::Get.new uri.request_uri)
    response.kind_of?(Net::HTTPSuccess).should be_true
  end
end
