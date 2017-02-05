require 'spec_helper'

describe Humanize::Byte do
  let(:b) { Humanize::Byte.new(2147843648) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Byte.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(b.value).to eq(2147843648)
    end
  end

  context "#to_b" do
    it "should return return self" do
      expect(b.to_b).to be b
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(b.to_k).to be_an_instance_of(Humanize::Kilo)
    end
    it "should convert the value to Kilo bytes" do
      expect(b.to_k.value).to eq(2097503.5625)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(b.to_m).to be_an_instance_of(Humanize::Mega)
    end
    it "should convert the value to Mega bytes" do
      expect(b.to_m.value).to eq(2048.3433227539062)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(b.to_g).to be_an_instance_of(Humanize::Giga)
    end
    it "should convert the value to Giga bytes" do
      expect(b.to_g.value).to eq(2.0003352761268616)
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(b.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(b.to_t.value).to eq(0.0019534524180926383)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(b.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(b.to_p.value).to eq(0.000001907668377043592)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(b.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(b.to_e.value).to eq(0.000000001862957399456633)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(b.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(b.to_z.value).to eq(0.000000000001819294335406868)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(b.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(b.to_y.value).to eq(0.0000000000000017766546244207696)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(b.to_s).to eq('2147843648')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @b = Humanize::Byte.new(2147843648.2345)
      end

      it "should return a float with specified digits" do
        expect(@b.to_s(:decimal_digits => 2)).to eq('2147843648.23')
      end
    end
  end
end
