require "spec_helper"

describe ApplicationHelper do
  describe "#page_title" do
    let(:base) { "PHS Student Council" }

    context "when passed a valid title" do
      it "returns a piped page title" do
        helper.page_title("Test").should == "#{base} | Test"
      end
    end

    context "when passed a blank title" do
      it "returns a generic page title" do
        [nil, "", " "].each do |test|
          helper.page_title(test).should == "#{base} Website"
        end
      end
    end
  end

  describe "#nav_link" do
    context "when on the requested page" do
      before { stub!(:current_page?).and_return true }

      context "with one path as a parameter" do
        it "returns an active element" do
          nav_link("Home", root_path).should ==
            "<li class=\"active\"><a href=\"#{root_path}\">Home</a></li>"
        end
      end

      context "with multiple paths as parameters" do
        it "returns an active element with the first path as the href" do
          nav_link("Test", root_path, contact_path).should ==
            "<li class=\"active\"><a href=\"#{root_path}\">Test</a></li>"

          nav_link("Test", contact_path, root_path).should ==
            "<li class=\"active\"><a href=\"#{contact_path}\">Test</a></li>"
        end
      end
    end

    context "when not on the requested page" do
      before { stub!(:current_page?).and_return false }

      context "with one path as a parameter" do
        it "returns an inactive element" do
          nav_link("Home", root_path).should ==
            "<li><a href=\"#{root_path}\">Home</a></li>"
        end
      end

      context "with multiple paths as parameters" do
        it "returns an inactive element with the first path as the href" do
          nav_link("Test", root_path, contact_path).should ==
            "<li><a href=\"#{root_path}\">Test</a></li>"

          nav_link("Test", contact_path, root_path).should ==
            "<li><a href=\"#{contact_path}\">Test</a></li>"
        end
      end
    end
  end
end
