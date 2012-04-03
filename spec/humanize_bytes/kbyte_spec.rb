require 'spec_helper'

describe Humanize::Bytes::Kilo do
  let(:k) { Humanize::Bytes::Kilo.new(5000) }

  context "#value" do
    it "should return the value" do
      k.value.should == 5000
    end
  end

  context "#to_b" do
    it "should convert the value to bytes" do
      k.to_b.should == 5120000
    end
  end

  context "#to_k" do
    it "should return the value" do
      k.to_k.should == 5000
    end
  end

  context "#to_m" do
    it "should convert the value to mega bytes" do
      k.to_m.should == 4.8828125
    end
  end

  context "#to_g" do
    it "should convert the value to giga bytes" do
      Humanize::Bytes::Kilo.new(5120000).to_g.should == 4.8828125
    end
  end

  context "#to_s" do
    context "when value is an integer" do
      it "should print a humanized version of the value" do
        k.to_s.should == '5000 kilo bytes'
      end
    end

    context "when value is an integer" do
      it "should print a humanized version of the value" do
        Humanize::Bytes::Kilo.new(4.997).to_s.should == '4.99 kilo bytes'
      end
    end
  end
end