function RTB2004_singleshot(RTB2004object)
    string = sprintf('SING;*OPC?');
    fprintf(RTB2004object, string);
end

