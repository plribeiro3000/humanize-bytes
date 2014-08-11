require 'spec_helper'

describe Humanize::Kilo do
  let(:k) { Humanize::Kilo.new(5000) }

  context "#value" do
    it "should return the value" do
      k.value.should == 5000
    end
  end

  context "#to_b" do
    it "should convert to Byte" do
      k.to_b.should be_an_instance_of(Humanize::Byte)
    end
    it "should convert the value to Bytes" do
      k.to_b.value.should == 5120000
    end
  end

  context "#to_k" do
    it "should return self" do
      k.to_k.should be k
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      k.to_m.should be_an_instance_of(Humanize::Mega)
    end
    it "should convert the value to Mega bytes" do
      k.to_m.value.should == 4.8828125
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      k.to_g.should be_an_instance_of(Humanize::Giga)
    end
    it "should convert the value to Giga bytes" do
      k.to_g.value.should ==  0.00476837158203125
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
        Humanize::Kilo.new(4.997).to_s.should == '4.99 kilo bytes'
      end
    end
  end
end