require 'spec_helper'

describe Humanize::Tera do
  let(:t) { Humanize::Tera.new(100) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Tera.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(t.value).to eq(100)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(t.to_b).to be_an_instance_of(Humanize::Byte)
    end 

    it "should convert the value to Byte" do
      expect(t.to_b.value).to eq(109951162777600)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(t.to_k).to be_an_instance_of(Humanize::Kilo)
    end 

    it "should convert the value to Kilo bytes" do
      expect(t.to_k.value).to eq(107374182400)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(t.to_m).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert the value to Mega bytes" do
      expect(t.to_m.value).to eq(104857600)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(t.to_g).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert the value to Giga bytes" do
      expect(t.to_g.value).to eq(102400)
    end
  end

  context "#to_t" do
    it "should return self" do
      expect(t.to_t).to be t
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(t.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(t.to_p.value).to eq(0.09765625)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(t.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(t.to_e.value).to eq(0.000095367431640625)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(t.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(t.to_z.value).to eq(0.00000009313225746154785)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(t.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(t.to_y.value).to eq(0.00000000009094947017729282)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(t.to_s).to eq('100')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @t = Humanize::Tera.new 100.05
      end

      it "should return a float with specified digits" do
        expect(@t.to_s(:decimal_digits => 2)).to eq('100.05')
      end
    end
  end
end
