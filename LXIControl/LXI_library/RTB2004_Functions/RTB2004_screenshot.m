function RTB2004_screenshot(RTB2004object, filename)
    string = sprintf('MMEMory:NAME "%s"', filename);
    fprintf(RTB2004object, string);
    
    string = sprintf('MMEMory:CDIRectory "/USB_FRONT/RTB2004"');
    fprintf(RTB2004object, string);
    
    string = sprintf('HCOPy:FORMat PNG');
    fprintf(RTB2004object, string);
    
    string = sprintf('HCOPy');
    fprintf(RTB2004object, string);
end

