require 'spec_helper'

describe Humanize::Mega do
  let(:m) { Humanize::Mega.new(4.8828125) }

  context "#value" do
    it "should return the value" do
      expect(m.value).to eq(4.8828125)
    end
  end

  context "#to_b" do
    it "should convert to Byte" do
      expect(m.to_b).to be_an_instance_of(Humanize::Byte)
    end
    it "should convert the value to Bytes" do
      expect(m.to_b.value).to eq(5120000)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(m.to_k).to be_an_instance_of(Humanize::Kilo)
    end
    it "should convert the value to Kilo bytes" do
      expect(m.to_k.value).to eq(5000)
    end
  end

  context "#to_m" do
    it "should return self" do
      expect(m.to_m).to be m
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(m.to_g).to be_an_instance_of(Humanize::Giga)
    end
    it "should convert the value to Giga bytes" do
      expect(m.to_g.value).to eq(0.00476837158203125)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(m.to_s).to eq(4.8828125)
      end
    end

    context 'with decimal_digits specified' do
      it "should return a float with specified digits" do
        expect(m.to_s(:decimal_digits => 1)).to eq(4.9)
      end
    end
  end
end