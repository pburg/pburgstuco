require "spec_helper"

describe "Downloads" do
  subject { page }
  before(:each) { visit downloads_path }

  FILES = Dir[Rails.root.join "public", "downloads", "*"].
          select { |entry| File.file? entry }

  FILES.each do |file|
    it { should have_selector "td", text: File.basename(file, ".*").titlecase }
    it { should have_selector "td", text: File.extname(file)[1..-1].upcase }
  end
end
