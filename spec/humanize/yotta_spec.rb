require 'spec_helper'

describe Humanize::Yotta do
  let(:y) { Humanize::Yotta.new(7) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Yotta.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(y.value).to eq(7)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(y.to_b).to be_an_instance_of(Humanize::Byte)
    end 

    it "should convert the value to Byte" do
      expect(y.to_b.value).to eq(8.462480737302404e+24)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(y.to_k).to be_an_instance_of(Humanize::Kilo)
    end 

    it "should convert the value to Kilo bytes" do
      expect(y.to_k.value).to eq(8.264141345021879e+21)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(y.to_m).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert the value to Mega bytes" do
      expect(y.to_m.value).to eq(8.070450532247929e+18)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(y.to_g).to be_an_instance_of(Humanize::Giga)
    end
    
    it "should convert the value to Giga bytes" do
      expect(y.to_g.value).to eq(7.881299347898368e+15)
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(y.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(y.to_t.value).to eq(7696581394432)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(y.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(y.to_p.value).to eq(7516192768)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(y.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(y.to_e.value).to eq(7340032)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(y.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(y.to_z.value).to eq(7168)
    end
  end

  context "#to_y" do
    it "should return self" do
      expect(y.to_y).to be y
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(y.to_s).to eq('7')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @y = Humanize::Yotta.new 7.13
      end

      it "should return a float with specified digits" do
        expect(@y.to_s(:decimal_digits => 2)).to eq('7.13')
      end
    end
  end
end
