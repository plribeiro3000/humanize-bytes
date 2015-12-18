require 'spec_helper'

describe Humanize::Kilo do
  let(:k) { Humanize::Kilo.new(5000) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Kilo.new('3').value).to be_an_instance_of(Float)
    end
  end

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

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(k.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(k.to_t.value).to eq(0.000004656612873077393)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(k.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(k.to_p.value).to eq(0.000000004547473508864641)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(k.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(k.to_e.value).to eq(0.000000000004440892098500626)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(k.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(k.to_z.value).to eq(0.000000000000004336808689942018)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(k.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(k.to_y.value).to eq(4.235164736271502e-18)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(k.to_s).to eq('5000')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @k = Humanize::Kilo.new(2147843648.2345)
      end

      it "should return a float with specified digits" do
        expect(@k.to_s(:decimal_digits => 1)).to eq('2147843648.2')
      end
    end
  end
end