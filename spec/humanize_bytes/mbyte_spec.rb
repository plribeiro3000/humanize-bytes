require 'spec_helper'

describe Humanize::Bytes::Mega do
  let(:m) { Humanize::Bytes::Mega.new(4.8828125) }

  context "#value" do
    it "should return the value" do
      m.value.should == 4.8828125
    end
  end

  context "#to_b" do
    it "should convert the value to bytes" do
      m.to_b.should == 5120000
    end
  end

  context "#to_k" do
    it "should convert the value to kilo bytes" do
      m.to_k.should == 5000
    end
  end

  context "#to_m" do
    it "should return the value" do
      m.to_m.should == 4.8828125
    end
  end

  context "#to_g" do
    it "should convert the value to giga bytes" do
      Humanize::Bytes::Mega.new(1000).to_g.should == 0.9765625
    end
  end

  context "#to_s" do
    context "when value is a decimal" do
      it "should print a humanized version of the value" do
        m.to_s.should == '4.88 mega bytes'
      end
    end

    context "when value is an integer" do
      it "should print a humanized version of the value" do
        Humanize::Bytes::Mega.new(4).to_s.should == '4 mega bytes'
      end
    end
  end
end