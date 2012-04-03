require 'spec_helper'

describe Humanize::Bytes::Giga do
  let(:g) { Humanize::Bytes::Giga.new(3.25) }

  context "#value" do
    it "should return the value" do
      g.value.should == 3.25
    end
  end

  context "#to_b" do
    it "should convert the value to bytes" do
      g.to_b.should == 3489660928
    end
  end

  context "#to_k" do
    it "should convert the value to kilo bytes" do
      g.to_k.should == 3407872
    end
  end

  context "#to_m" do
    it "should convert the value to mega bytes" do
      g.to_m.should == 3328
    end
  end

  context "#to_g" do
    it "should return the value" do
      g.to_g.should == 3.25
    end
  end

  context "#to_s" do
    context "when value is a decimal" do
      it "should print a humanized version of the value" do
        g.to_s.should == '3.25 giga bytes'
      end
    end

    context "when value is an integer" do
      it "should print a humanized version of the value" do
        Humanize::Bytes::Giga.new(4).to_s.should == '4 giga bytes'
      end
    end
  end
end