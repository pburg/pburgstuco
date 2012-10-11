require "spec_helper"

describe PagesController do
  %w[home members events photos downloads constitution contact].each do |c|
    describe "GET '#{c}'" do
      it "returns http success" do
        get c
        response.should be_success
      end
    end
  end
end
