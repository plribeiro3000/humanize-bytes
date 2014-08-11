require 'spec_helper'

describe Humanize::Giga do
  let(:g) { Humanize::Giga.new(3.25) }

  context "#value" do
    it "should return the value" do
      g.value.should == 3.25
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      g.to_b.should be_an_instance_of(Humanize::Byte)
    end 
    it "should convert the value to Byte" do
      g.to_b.value.should == 3489660928
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      g.to_k.should be_an_instance_of(Humanize::Kilo)
    end 
    it "should convert the value to Kilo bytes" do
      g.to_k.value.should == 3407872
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      g.to_m.should be_an_instance_of(Humanize::Mega)
    end
    it "should convert the value to Mega bytes" do
      g.to_m.value.should == 3328
    end
  end

  context "#to_g" do
    it "should return self" do
      g.to_g.should be g
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
        Humanize::Giga.new(4).to_s.should == '4 giga bytes'
      end
    end
  end
end