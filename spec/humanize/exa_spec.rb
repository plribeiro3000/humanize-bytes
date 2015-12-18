require 'spec_helper'

describe Humanize::Exa do
  let(:e) { Humanize::Exa.new(205) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Exa.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(e.value).to eq(205)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(e.to_b).to be_an_instance_of(Humanize::Byte)
    end 

    it "should convert the value to Byte" do
      expect(e.to_b.value).to eq(2.3634890844440363e+20)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(e.to_k).to be_an_instance_of(Humanize::Kilo)
    end 

    it "should convert the value to Kilo bytes" do
      expect(e.to_k.value).to eq(230809480902737920)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(e.to_m).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert the value to Mega bytes" do
      expect(e.to_m.value).to eq(225399883694080)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(e.to_g).to be_an_instance_of(Humanize::Giga)
    end
    
    it "should convert the value to Giga bytes" do
      expect(e.to_g.value).to eq(220117073920)
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(e.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(e.to_t.value).to eq(214958080)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(e.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(e.to_p.value).to eq(209920)
    end
  end

  context "#to_e" do
    it "should return self" do
      expect(e.to_e).to be e
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(e.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(e.to_z.value).to eq(0.2001953125)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(e.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(e.to_y.value).to eq(0.00019550323486328125)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(e.to_s).to eq('205')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @e = Humanize::Exa.new 205.534
      end

      it "should return a float with specified digits" do
        expect(@e.to_s(:decimal_digits => 3)).to eq('205.534')
      end
    end
  end
end
