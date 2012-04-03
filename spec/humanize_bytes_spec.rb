require 'spec_helper'

describe Humanize::Bytes do
  describe "#initialize" do
    context "when the second parameter is nil" do
      it "should return a new Byte instance" do
        Humanize::Bytes.initialize(1024).should be_instance_of(Humanize::Bytes::Byte)
      end
    end

    context "when the second parameter is 'b'" do
      it "should return a new Kilo instance" do
        Humanize::Bytes.initialize(1024, 'b').should be_instance_of(Humanize::Bytes::Byte)
      end
    end

    context "when the second parameter is 'k'" do
      it "should return a new Kilo instance" do
        Humanize::Bytes.initialize(1024, 'k').should be_instance_of(Humanize::Bytes::Kilo)
      end
    end

    context "when the second parameter is 'm'" do
      it "should return a new Mega instance" do
        Humanize::Bytes.initialize(1024, 'm').should be_instance_of(Humanize::Bytes::Mega)
      end
    end

    context "when the second parameter is 'g'" do
      it "should return a new Giga instance" do
        Humanize::Bytes.initialize(1024, 'g').should be_instance_of(Humanize::Bytes::Giga)
      end
    end

    context "when the second parameter is :b" do
      it "should return a new Kilo instance" do
        Humanize::Bytes.initialize(1024, :b).should be_instance_of(Humanize::Bytes::Byte)
      end
    end

    context "when the second parameter is :k" do
      it "should return a new Kilo instance" do
        Humanize::Bytes.initialize(1024, :k).should be_instance_of(Humanize::Bytes::Kilo)
      end
    end

    context "when the second parameter is :m" do
      it "should return a new Mega instance" do
        Humanize::Bytes.initialize(1024, :m).should be_instance_of(Humanize::Bytes::Mega)
      end
    end

    context "when the second parameter is :g" do
      it "should return a new Giga instance" do
        Humanize::Bytes.initialize(1024, :g).should be_instance_of(Humanize::Bytes::Giga)
      end
    end

    context "when the second parameter is any other thing" do
      it "should return nil" do
        Humanize::Bytes.initialize(1024, :thing).should be_nil
      end
    end
  end
end