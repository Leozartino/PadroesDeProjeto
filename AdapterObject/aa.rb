class InterfaceLightningPhone 
  def recharge
    raise NotImplementedError, 'recharge(), Deve ser implementada!';
  end;
  def useLightning
    raise NotImplementedError, 'useLightning(), Deve ser implementada!';
  end;
end

class InterfaceMicroUsbPhone 
  def recharge
    raise NotImplementedError, 'recharge(), Deve ser implementada!';
  end;
  def useMicroUsb
    raise NotImplementedError, 'useMicroUsb(), Deve ser implementada!';
  end;
end

class Iphone < InterfaceLightningPhone
  attr_reader :connector;

  def useLightning
      connector = true;
      puts "Lightning connected";
  end


  def recharge
      if (connector) 
          puts "Recharge started";
          puts "Recharge finished";
       else 
          puts "Connect Lightning first";
      end
  end
end

class Android < InterfaceMicroUsbPhone 
  attr_reader :connector;

  def useMicroUsb 
      connector = true;
      puts "MicroUsb connected";
  end

  def recharge 
      if (connector) 
          puts "Recharge started";
          puts "Recharge finished";
       else 
          puts "Connect MicroUsb first";
       end
  end
end

class LightningToMicroUsbAdapter < InterfaceMicroUsbPhone 
  attr_reader :lightningPhone;

  def LightningToMicroUsbAdapter(lightningPhone) 
      @lightningPhone = lightningPhone;
  end
  
  def useMicroUsb 
      puts "MicroUsb connected";
      lightningPhone.useLightning();
  end

  
  def recharge 
      lightningPhone.recharge();
  end
end

class AdapterDemo 
  def rechargeMicroUsbPhone(phone) 
      phone.useMicroUsb();
      phone.recharge();
  end

  def rechargeLightningPhone( phone) 
      phone.useLightning();
      phone.recharge();
  end
  
end



      android = Android.new();
      iPhone = Iphone.new();
      adptado = AdapterDemo.new();

      puts "Recharging android with MicroUsb";
      adptado.rechargeMicroUsbPhone(android);

      puts "Recharging iPhone with Lightning";
      adptado.rechargeLightningPhone(iPhone);

      puts "Recharging iPhone with MicroUsb";
      adptado.rechargeMicroUsbPhone(LightningToMicroUsbAdapter.new(iPhone));
  
