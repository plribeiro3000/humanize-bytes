require 'spec_helper'

describe Humanize::Kilo do
  let(:k) { Humanize::Kilo.new(5000) }

  context "#value" do
    it "should return the value" do
      expect(k.value).to eq(5000)
    end
  end

  context "#to_b" do
    it "should convert to Byte" do
      expect(k.to_b).to be_an_instance_of(Humanize::Byte)
    end
    it "should convert the value to Bytes" do
      expect(k.to_b.value).to eq(5120000)
    end
  end

  context "#to_k" do
    it "should return self" do
      expect(k.to_k).to be k
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(k.to_m).to be_an_instance_of(Humanize::Mega)
    end
    it "should convert the value to Mega bytes" do
      expect(k.to_m.value).to eq(4.8828125)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(k.to_g).to be_an_instance_of(Humanize::Giga)
    end
    it "should convert the value to Giga bytes" do
      expect(k.to_g.value).to eq(0.00476837158203125)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(k.to_s).to eq(5000.0)
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @k = Humanize::Kilo.new(2147843648.2345)
      end

      it "should return a float with specified digits" do
        expect(@k.to_s(:decimal_digits => 1)).to eq(2147843648.2)
      end
    end
  end
end