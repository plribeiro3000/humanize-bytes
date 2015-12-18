require 'spec_helper'

describe Humanize::Peta do
  let(:p) { Humanize::Peta.new(125) }

  context "initialize" do
    it "should convert the number to float" do
      expect(Humanize::Peta.new('3').value).to be_an_instance_of(Float)
    end
  end

  context "#value" do
    it "should return the value" do
      expect(p.value).to eq(125)
    end
  end

  context "#to_b" do
    it "should convert to Bytes" do
      expect(p.to_b).to be_an_instance_of(Humanize::Byte)
    end 

    it "should convert the value to Byte" do
      expect(p.to_b.value).to eq(140737488355328000)
    end
  end

  context "#to_k" do
    it "should convert to Kilo bytes" do
      expect(p.to_k).to be_an_instance_of(Humanize::Kilo)
    end 

    it "should convert the value to Kilo bytes" do
      expect(p.to_k.value).to eq(137438953472000)
    end
  end

  context "#to_m" do
    it "should convert to Mega bytes" do
      expect(p.to_m).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert the value to Mega bytes" do
      expect(p.to_m.value).to eq(134217728000)
    end
  end

  context "#to_g" do
    it "should convert to Giga bytes" do
      expect(p.to_g).to be_an_instance_of(Humanize::Giga)
    end
    
    it "should convert the value to Giga bytes" do
      expect(p.to_g.value).to eq(131072000)
    end
  end

  context "#to_t" do
    it "should convert to Tera bytes" do
      expect(p.to_t).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert the value to Tera bytes" do
      expect(p.to_t.value).to eq(128000)
    end
  end

  context "#to_p" do
    it "should return self" do
      expect(p.to_p).to be p
    end
  end

  context "#to_e" do
    it "should convert to Exa bytes" do
      expect(p.to_e).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert the value to Exa bytes" do
      expect(p.to_e.value).to eq(0.1220703125)
    end
  end

  context "#to_z" do
    it "should convert to Zetta bytes" do
      expect(p.to_z).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert the value to Zetta bytes" do
      expect(p.to_z.value).to eq(0.00011920928955078125)
    end
  end

  context "#to_y" do
    it "should convert to Yotta bytes" do
      expect(p.to_y).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert the value to Yotta bytes" do
      expect(p.to_y.value).to eq(0.00000011641532182693481)
    end
  end

  context "#to_s" do
    context 'without any specification' do
      it "should return a float with all digits" do
        expect(p.to_s).to eq('125')
      end
    end

    context 'with decimal_digits specified' do
      before :each do
        @p = Humanize::Peta.new 125.532
      end

      it "should return a float with specified digits" do
        expect(@p.to_s(:decimal_digits => 3)).to eq('125.532')
      end
    end
  end
end
