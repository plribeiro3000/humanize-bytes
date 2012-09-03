require 'spec_helper'

describe Humanize::Bytes::Byte do
  let(:b) { Humanize::Bytes::Byte.new(2147843648) }

  context "#value" do
    it "should return the value" do
      b.value.should == 2147843648
    end
  end

  context "#to_b" do
    it "should return return self" do
      b.to_b.should be b
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      b.to_k.class.should be Kilo
    end
    it "should convert the value to Kilo bytes" do
      b.to_k.value.should == 2097503.5625
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      b.to_m.class.should be Mega
    end
    it "should convert the value to Mega bytes" do
      b.to_m.value.should ==  2048.3433227539062
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      b.to_g.class.should be Giga
    end 
    it "should convert the value to Giga bytes" do
      b.to_g.value.should == 2.0003352761268616
    end
  end

  context "#to_s" do
    context "when value is an integer" do
      it "should print a humanized version of the value" do
        b.to_s.should == '2147843648 bytes'
      end
    end

    context "when value is an integer" do
      it "should print a humanized version of the value" do
        Humanize::Bytes::Byte.new(4.997).to_s.should == '4.99 bytes'
      end
    end
  end
end