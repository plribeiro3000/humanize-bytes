require 'spec_helper'

describe Humanize::Bytes do
  describe "#initialize" do
    context "when no unit is specified" do
      it "should return a new Byte instance" do
        Humanize::Bytes.initialize(1024).should be_instance_of(Humanize::Bytes::Byte)
      end
    end

    context "when kilo is specfied as unit" do
      it "should return a new Kilo instance" do
        Humanize::Bytes.initialize(1024, 'k').should be_instance_of(Humanize::Bytes::Kilo)
      end
    end

    context "when mega is specfied as unit" do
      it "should return a new Mega instance" do
        Humanize::Bytes.initialize(1024, 'm').should be_instance_of(Humanize::Bytes::Mega)
      end
    end

    context "when giga is specfied as unit" do
      it "should return a new Giga instance" do
        Humanize::Bytes.initialize(1024, 'g').should be_instance_of(Humanize::Bytes::Giga)
      end
    end
  end
end