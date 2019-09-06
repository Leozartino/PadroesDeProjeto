 class AbstractFormatIphone
  attr_reader :connector;

  def recharge
    raise NotImplementedError, 'recharge(), Deve ser implementada!';
  end

  def use_lightning
    raise NotImplementedError, 'use_lightning(), Deve ser implementada!';
    end
end

class AbstractFormatAndroid
  attr_reader :connector;

  def recharge
    raise NotImplementedError, 'recharge(), Deve ser implementada!';
  end
  def use_micro_usb
    raise NotImplementedError, 'use_micro_usb(), Deve ser implementada!';
  end
end

class Iphone < AbstractFormatIphone
  def initialize
    @connector = false
  end

  def use_lightning
    @connector = true
    puts "Lightning connected"
  end

  def recharge
    if @connector
      puts "Recharge started"
      puts "Recharge finished"
    else
      puts "Connect Lightning first"
  end
end

class Android < AbstractFormatAndroid
  def initialize
    @connector = false
  end

  def use_micro_usb
    @connector = true
    puts "MicroUsb connected"
  end

  def recharge
    if @connector
      puts "Recharge started"
      puts "Recharge finished"
    else
      puts "Connect MicroUsb first"
    end
  end
end

class IphoneAdapter < AbstractFormatAndroid
 attr_reader :FormatIphone;

  def initialize(mobile)
    @mobile = mobile
  end

  def recharge
    @mobile.recharge
  end

  def use_micro_usb
    puts "MicroUsb connected"
    @mobile.use_lightning
  end
end

class AndroidRecharger
  def initialize
    phone = Android.new
    phone.use_micro_usb
    phone.recharge
  end
end

class IphoneMicroUsbRecharger
  def initialize
    phone = Iphone.new
    phone_adapter = IphoneAdapter.new(phone)
    phone_adapter.use_micro_usb
    phone_adapter.recharge
  end
end

class IphoneRecharger
  def initialize(phone)
    phone = Iphone.new
    phone.use_lightning
    phone.recharge
  end
end

puts "Recharging android with MicroUsb Recharger"
androidGenerico = AndroidRecharger.new


puts "Recharging iPhone with MicroUsb using Adapter pattern"
iphoneMicroUSBGenerico = IphoneMicroUsbRecharger.new


puts "Recharging iPhone with iPhone Recharger"
iphoneRech = IphoneRecharger.new()