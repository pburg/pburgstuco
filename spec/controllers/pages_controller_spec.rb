require "spec_helper"

describe PagesController do
  PAGES_ACTIONS.each do |c|
    describe "GET '#{c}'" do
      it "returns http success" do
        get c
        response.should be_success
      end
    end
  end
end
