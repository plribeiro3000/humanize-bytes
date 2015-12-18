require 'spec_helper'

describe Humanize::Zetta do
  let(:z) { Humanize::Zetta.new(35) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Zetta.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(z.value).to eq(35)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(z.to_b).to be_an_instance_of(Humanize::Byte)
    end 

    it "should convert the value to Byte" do
      expect(z.to_b.value).to eq(4.1320706725109396e+22)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(z.to_k).to be_an_instance_of(Humanize::Kilo)
    end 

    it "should convert the value to Kilo bytes" do
      expect(z.to_k.value).to eq(4.0352252661239644e+19)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(z.to_m).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert the value to Mega bytes" do
      expect(z.to_m.value).to eq(3.940649673949184e+16)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(z.to_g).to be_an_instance_of(Humanize::Giga)
    end
    
    it "should convert the value to Giga bytes" do
      expect(z.to_g.value).to eq(38482906972160)
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(z.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(z.to_t.value).to eq(37580963840)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(z.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(z.to_p.value).to eq(36700160)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(z.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(z.to_e.value).to eq(35840)
    end
  end

  context "#to_z" do
    it "should return self" do
      expect(z.to_z).to be z
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(z.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(z.to_y.value).to eq(0.0341796875)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(z.to_s).to eq('35')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @z = Humanize::Zetta.new 35.15
      end

      it "should return a float with specified digits" do
        expect(@z.to_s(:decimal_digits => 2)).to eq('35.15')
      end
    end
  end
end
