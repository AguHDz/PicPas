{Rutina de verificación para operaciones de comparación con datos 
de tipo WORD. 
Se debe simular el programa en el circuito "Test1.DSN". Se debe 
escuchar, una serie de pitidos cortos. Si se escucha un pitido 
largo, es que hubo algún error en el resultado de alguna operación.}
{$PROCESSOR PIC16F84}
{$FREQUENCY 8Mhz}
uses PIC16F84A;
var
  pinLed: bit absolute PORTB.0;
  a, b: word;

  procedure bien;
  begin
    pinLed := 1;
    delay_ms(30);
    pinLed := 0;
    delay_ms(30);
  end;
  procedure Mal;
  begin
    pinLed := 1;
    delay_ms(1500);
    pinLed := 0;
    asm SLEEP end
  end;
begin
  SetAsOutput(pinLed);
  pinLed := 0;

  //////////////////////////////////////////////////////////
	//////////////////  Operación Mayor /////////////////////
  //////////////////////////////////////////////////////////

	//coConst_Const
  if word(0) > word(0) then mal else bien end;
  if word(10) > word(9) then bien else mal end;

	//coConst_Variab
  a := 0;  
  if word(0) > a then mal else bien end;
  a := 1000;  
  if 1000 > a then mal else bien end;
  if 1001 > a then bien else mal end;
  //coConst_Expres
  a := 0;  
  if word(1) > (a+1) then mal else bien end;
  a := 999;  
  if 1000 > (a+1) then mal else bien end;
  if 1001 > (a+1) then bien else mal end;
  //coVariab_Const
  //<<No implemented>>

  //coVariab_Variab
  a := 0; b := 0; 
  if a > b then mal else bien end;
  a := 256; b := 255; 
  if a > b then bien else mal end;
  if b > a then mal else bien end;
  a := 1000; b := 1000; 
  if a > b then mal else bien end;
  a := 1001; b := 1000; 
  if a > b then bien else mal end;
  //coVariab_Expres
  a := 1; b := 0; 
  if a > (b+1) then mal else bien end;
  a := 256; b := 254; 
  if a > (b+1) then bien else mal end;
  if a > (b+2) then mal else bien end;
  a := 1001; b := 1000; 
  if a > (b+1) then mal else bien end;
  a := 1001; b := 999; 
  if a > (b+1) then bien else mal end;
  //coExpres_Const
  //<<No implemented>>

  //coExpres_Variab
  //<<No implemented>>

  //coExpres_Expres
  a := 0; b := 0; 
  if (a+1) > (b+1) then mal else bien end;
  a := 254; b := 254; 
  if (a+1) > (b+1) then mal else bien end;
  if (a+2) > (b+1) then bien else mal end;
  a := 1000; b := 1000; 
  if (a+1) > (b+2) then mal else bien end;
  if (a+1) > (b+1) then mal else bien end;
  if (a+2) > (b+1) then bien else mal end;

end.
