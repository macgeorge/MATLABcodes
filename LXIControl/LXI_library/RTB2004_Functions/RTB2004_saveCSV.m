function RTB2004_saveCSV(RTB2004object, filename)
  
    string = sprintf('FORMAT CSV');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce CH1');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%s1"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce CH2');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%s2"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce CH3');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%s3"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce CH4');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%s4"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce D70');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%sd0"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
    string = sprintf('EXPort:WAVeform:SOURce D158');
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:NAME "/USB_FRONT/RTB2004/%sd1"', filename);
    fprintf(RTB2004object, string);
    string = sprintf('EXPort:WAVeform:SAVE');
    fprintf(RTB2004object, string);
    
end