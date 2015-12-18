require 'spec_helper'

describe Humanize::Giga do
  let(:g) { Humanize::Giga.new(3.25) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Giga.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(g.value).to eq(3.25)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(g.to_b).to be_an_instance_of(Humanize::Byte)
    end 
    it "should convert the value to Byte" do
      expect(g.to_b.value).to eq(3489660928)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(g.to_k).to be_an_instance_of(Humanize::Kilo)
    end 
    it "should convert the value to Kilo bytes" do
      expect(g.to_k.value).to eq(3407872)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(g.to_m).to be_an_instance_of(Humanize::Mega)
    end
    it "should convert the value to Mega bytes" do
      expect(g.to_m.value).to eq(3328)
    end
  end

  context "#to_g" do
    it "should return self" do
      expect(g.to_g).to be g
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(g.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(g.to_t.value).to eq(0.003173828125)
    end
  end

  context "#to_p" do
    it "should convert to Peta bytes" do
      expect(g.to_p).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert the value to Peta bytes" do
      expect(g.to_p.value).to eq(0.0000030994415283203125)
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(g.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(g.to_e.value).to eq(0.000000003026798367500305)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(g.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(g.to_z.value).to eq(0.0000000000029558577807620168)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(g.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(g.to_y.value).to eq(0.000000000000002886579864025407)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(g.to_s).to eq('3.25')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @g = Humanize::Giga.new 3.22
      end

      it "should return a float with specified digits" do
        expect(@g.to_s(:decimal_digits => 1)).to eq('3.2')
      end
    end
  end
end