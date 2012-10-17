require "spec_helper"

describe PagesHelper do
  describe "#sane_file_size" do
    it "does not change bytes" do
      sane_file_size(150.bytes).should == "150 Bytes"
    end

    it "changes kilobytes" do
      sane_file_size(1.5.kilobytes).should == "1.5 KB"
    end

    it "changes megabytes" do
      sane_file_size(1.5.megabytes).should == "1.5 MB"
    end

    it "changes gigabytes" do
      sane_file_size(1.5.gigabytes).should == "1.5 GB"
    end

    it "rounds down properly to the tenths" do
      sane_file_size(1.72.megabytes).should == "1.7 MB"
    end

    it "rounds up properly to the tenths" do
      sane_file_size(1.78.megabytes).should == "1.8 MB"
    end

    it "has a singular unit for 1 byte" do
      sane_file_size(1.byte).should == "1 Byte"
    end

    it "returns 'Empty' for an empty file or a blank parameter" do
      sane_file_size(0).should == "Empty"
      sane_file_size(nil).should == "Empty"
    end

    it "displays whole numbers without a decimal" do
      sane_file_size(1.megabyte).should == "1 MB"
      sane_file_size(24.gigabytes).should == "24 GB"
    end
  end
end
