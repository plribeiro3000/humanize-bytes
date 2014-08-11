require 'spec_helper'

describe Humanize::Mega do
  let(:m) { Humanize::Mega.new(4.8828125) }

  context "#value" do
    it "should return the value" do
      m.value.should == 4.8828125
    end
  end

  context "#to_b" do
    it "should convert to Byte" do
      m.to_b.should be_an_instance_of(Humanize::Byte)
    end
    it "should convert the value to Bytes" do
      m.to_b.value.should == 5120000
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      m.to_k.should be_an_instance_of(Humanize::Kilo)
    end
    it "should convert the value to Kilo bytes" do
      m.to_k.value.should == 5000
    end
  end

  context "#to_m" do
    it "should return self" do
      m.to_m.should be m
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      m.to_g.should be_an_instance_of(Humanize::Giga)
    end
    it "should convert the value to Giga bytes" do
      m.to_g.value.should == 0.00476837158203125
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
        Humanize::Mega.new(4).to_s.should == '4 mega bytes'
      end
    end
  end
end