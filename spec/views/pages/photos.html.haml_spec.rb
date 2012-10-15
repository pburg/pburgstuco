require "spec_helper"

describe "Photos" do
  subject { page }
  before(:each) { visit photos_path }

  titles = Dir[Rails.root.join "app", "assets", "images", "photos", "*"].
           select { |entry| File.directory? entry }.
           map { |album| File.basename(album).titlecase }

  titles.each do |title|
    it { should have_selector "h2", text: title }
  end
end
