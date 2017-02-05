require 'spec_helper'

describe Humanize::HumanBytes do
  let(:b) { Humanize::Byte.new(1) }
  let(:k) { Humanize::Kilo.new(2) }
  let(:m) { Humanize::Mega.new(3) }
  let(:g) { Humanize::Giga.new(4) }
  let(:t) { Humanize::Tera.new(5) }
  let(:p) { Humanize::Peta.new(6) }
  let(:e) { Humanize::Exa.new(7) }
  let(:z) { Humanize::Zetta.new(8) }
  let(:y) { Humanize::Yotta.new(9) }

  context "initialize with non-humanizable measurements" do
    it "should be Byte(0) when passed a nil" do
      expect(Humanize::HumanBytes.new(nil).measure).to be_an_instance_of(Humanize::Byte)
      expect(Humanize::HumanBytes.new(nil).value).to be(0.0)
    end

    it "should be Byte(0) when passed a string" do
      expect(Humanize::HumanBytes.new('test').measure).to be_an_instance_of(Humanize::Byte)
      expect(Humanize::HumanBytes.new('test').value).to be(0.0)
    end

    it "should be Byte(0) when passed an integer" do
      expect(Humanize::HumanBytes.new(1).measure).to be_an_instance_of(Humanize::Byte)
      expect(Humanize::HumanBytes.new(1).value).to be(0.0)
    end

    it "should be Byte(0) when passed a float" do
      expect(Humanize::HumanBytes.new(1.0).measure).to be_an_instance_of(Humanize::Byte)
      expect(Humanize::HumanBytes.new(1.0).value).to be(0.0)
    end
  end

  context "initialize with stable measurements" do
    it "should convert keep class Byte when value < KILO" do
      expect(Humanize::HumanBytes.new(b).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert keep class Kilo when value < MEGA and >= KILO" do
      expect(Humanize::HumanBytes.new(k).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert keep class Mega when value < GIGA and >= MEGA" do
      expect(Humanize::HumanBytes.new(m).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert keep class Giga when value < TERA and >= GIGA" do
      expect(Humanize::HumanBytes.new(g).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert keep class Tera when value < PETA and >= TERA" do
      expect(Humanize::HumanBytes.new(t).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert keep class Peta when value < ZETA and >= PETA" do
      expect(Humanize::HumanBytes.new(p).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert keep class Exa when value < ZETA and >= EXA" do
      expect(Humanize::HumanBytes.new(e).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert keep class Zetta when value < YOTTA and >= ZETA" do
      expect(Humanize::HumanBytes.new(z).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert keep class Yotta when value > YOTTA" do
      expect(Humanize::HumanBytes.new(y).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end

  context "initialize with Byte measurements" do
    it "should convert keep class Byte when value is 0" do
      x = Humanize::Byte.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert keep class Byte when value is < KILO" do
      x = Humanize::Byte.new(1023)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Kilo when value = KILO" do
      x = Humanize::Byte.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Byte.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Byte.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Byte.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Byte.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Byte.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Byte.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Byte.new(1024*1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Byte.new(1024*1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end
    # Due to floats precision, any further tests using large amounts of bytes will fail    
  end

  context "initialize with Byte measurements" do
    it "should convert keep class Byte when value is 0" do
      x = Humanize::Byte.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert keep class Byte when value is < KILO" do
      x = Humanize::Byte.new(1023)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Kilo when value = KILO" do
      x = Humanize::Byte.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Byte.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Byte.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Byte.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Byte.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Byte.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Byte.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Byte.new(1024*1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Byte.new(1024*1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end
    # Due to floats precision, any further tests using large amounts of bytes will fail    
  end

  context "initialize with Kilo measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Kilo.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Kilo.new(0.1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Kilo.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should keep class Kilo when value > KILO and < MEGA" do
      x = Humanize::Kilo.new(1024-1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Kilo.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Kilo.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Kilo.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Kilo.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Kilo.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Kilo.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Kilo.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Kilo.new(1024*1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Kilo.new(1024*1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    # Due to floats precision, any further tests using large amounts of kilos will fail    
  end

  context "initialize with Mega measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Mega.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Mega.new(1.0 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Mega.new(1.0 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Mega.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should keep class Mega when value = MEGA" do
      x = Humanize::Mega.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should keep class Mega when value > MEGA and < GIGA" do
      x = Humanize::Mega.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Mega.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Mega.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Mega.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Mega.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Mega.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Mega.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Mega.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Mega.new(1024*1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Mega.new(1024*1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    # Due to floats precision, any further tests using large amounts of megas will fail    
  end

  context "initialize with Giga measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Giga.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Giga.new(0.1 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Giga.new(1.0 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Giga.new(0.9 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Giga.new(1.0 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Giga.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should keep class Giga when value = GIGA" do
      x = Humanize::Giga.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should keep class Giga when value > GIGA and < TERA" do
      x = Humanize::Giga.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Giga.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Giga.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Giga.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Giga.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Giga.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Giga.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Giga.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Giga.new(1024*1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Yotta when value = YOTTA" do
      x = Humanize::Giga.new(1024*1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    # Due to floats precision, any further tests using large amounts of gigas will fail    
  end

  context "initialize with Tera measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Tera.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Tera.new(0.1 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Tera.new(1.0 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Tera.new(0.9 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Tera.new(1.0 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Tera.new(0.9 / 1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Tera.new(1 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Tera.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should keep class Tera when value = TERA" do
      x = Humanize::Tera.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should keep class Tera when value > TERA and < PETA" do
      x = Humanize::Tera.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Tera.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Tera.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Tera.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Tera.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Tera.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Tera.new(1024*1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Yotta when value = YOTTA" do
      x = Humanize::Tera.new(1024*1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert to class Yotta when value > YOTTA" do
      x = Humanize::Tera.new(1024*1024*1024*1024 + 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end

  context "initialize with Peta measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Peta.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Peta.new(0.1 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Peta.new(1.0 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Peta.new(0.9 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Peta.new(1.0 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Peta.new(0.9 / 1024**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Peta.new(1 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Peta.new(0.9 / 1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Peta.new(1 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Peta.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should keep class Peta when value = PETA" do
      x = Humanize::Peta.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should keep class Peta when value > TERA and < PETA" do
      x = Humanize::Peta.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Peta.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Peta.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Peta.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Peta.new(1024*1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Yotta when value = YOTTA" do
      x = Humanize::Peta.new(1024*1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert to class Yotta when value > YOTTA" do
      x = Humanize::Peta.new(1024*1024*1024 + 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end

  context "initialize with Exa measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Exa.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Exa.new(0.1 / 1024.0**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Exa.new(1.0 / 1024.0**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Exa.new(0.9 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Exa.new(1.0 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Exa.new(0.9 / 1024**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Exa.new(1 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Exa.new(0.9 / 1024**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Exa.new(1 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Exa.new(0.9 / 1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Exa.new(1 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Exa.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should keep class Exa when value = EXA" do
      x = Humanize::Exa.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should keep class Exa when value > EXA and < ZETTA" do
      x = Humanize::Exa.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Exa.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Exa.new(1024*1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Yotta when value = YOTTA" do
      x = Humanize::Exa.new(1024*1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert to class Yotta when value > YOTTA" do
      x = Humanize::Exa.new(1024*1024 + 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end

  context "initialize with Zetta measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Zetta.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Zetta.new(0.1 / 1024.0**6)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Zetta.new(1.0 / 1024.0**6)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Zetta.new(0.9 / 1024.0**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Zetta.new(1.0 / 1024.0**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Zetta.new(0.9 / 1024**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Zetta.new(1 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Zetta.new(0.9 / 1024**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Zetta.new(1 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Zetta.new(0.9 / 1024**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Zetta.new(1 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Zetta.new(0.9 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Zetta.new(1.0 / 1024.0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Zetta.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should keep class Zetta when value = ZETTA" do
      x = Humanize::Zetta.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should keep class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Zetta.new(1024 - 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Yotta when value = YOTTA" do
      x = Humanize::Zetta.new(1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    it "should convert to class Yotta when value > YOTTA" do
      x = Humanize::Zetta.new(1024 + 1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end

  context "initialize with Yotta measurements" do
    it "should convert to class Byte when value is 0" do
      x = Humanize::Yotta.new(0)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should convert to class Byte when value is < KILO" do
      x = Humanize::Yotta.new(0.1 / 1024.0**7)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Byte)
    end

    it "should keep to class Kilo when value = KILO" do
      x = Humanize::Yotta.new(1.0 / 1024.0**7)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Kilo when value > KILO and < MEGA" do
      x = Humanize::Yotta.new(0.9 / 1024.0**6)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Kilo)
    end

    it "should convert to class Mega when value = MEGA" do
      x = Humanize::Yotta.new(1.0 / 1024.0**6)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Mega when value > MEGA and < GIGA" do
      x = Humanize::Yotta.new(0.9 / 1024**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Mega)
    end

    it "should convert to class Giga when value = GIGA" do
      x = Humanize::Yotta.new(1 / 1024.0**5)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Giga when value > GIGA and < TERA" do
      x = Humanize::Yotta.new(0.9 / 1024**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Giga)
    end

    it "should convert to class Tera when value = TERA" do
      x = Humanize::Yotta.new(1 / 1024.0**4)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Tera when value > TERA and < PETA" do
      x = Humanize::Yotta.new(0.9 / 1024**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Tera)
    end

    it "should convert to class Peta when value = PETA" do
      x = Humanize::Yotta.new(1 / 1024.0**3)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Peta when value > TERA and < PETA" do
      x = Humanize::Yotta.new(0.9 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Peta)
    end

    it "should convert to class Exa when value = EXA" do
      x = Humanize::Yotta.new(1.0 / 1024.0**2)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Exa when value > EXA and < ZETTA" do
      x = Humanize::Yotta.new(0.9 / 1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Exa)
    end

    it "should convert to class Zetta when value = ZETTA" do
      x = Humanize::Yotta.new(1.0 / 1024)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should convert to class Zetta when value > ZETTA and < YOTTA" do
      x = Humanize::Yotta.new(0.9)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Zetta)
    end

    it "should keep class Yotta when value = YOTTA" do
      x = Humanize::Yotta.new(1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end

    it "should keep class Yotta when value > YOTTA" do
      x = Humanize::Yotta.new(1.1)
      expect(Humanize::HumanBytes.new(x).measure).to be_an_instance_of(Humanize::Yotta)
    end
  end
end
