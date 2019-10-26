function data = RTB2004_getData(RTB2004object)
  
    % check if the scope has triggered %
    triggerwaiting = 1;
    while triggerwaiting==1
        string = sprintf('STATus:OPERation:CONDition?');
        response = query(RTB2004object, string);
        response = str2double(response);
        if (response>7)
            triggerwaiting = 1;
        else
            triggerwaiting = 0;
        end
    end
    
    % set ASCII format %
    string = sprintf('FORMat ASCii');
    fprintf(RTB2004object, string);
    
    % Get time %
    headerwaiting = 1;
    while headerwaiting == 1;
        string = sprintf('CHANnel1:DATA:HEADer?');
        response = query(RTB2004object, string);
        xdata = sscanf(response, '%e, %e, %d, %d');
        if length(xdata)>1
            headerwaiting = 0;
        end
    end
    xstart = xdata(1);
    xend = xdata(2);
    xpoints = xdata(3);
    xstep = (xend-xstart)/(xpoints-1);
    data = xstart:xstep:xend;
    data = data.';
    
    index = 2;
    % Channel 1 %
    string = sprintf('CHANnel1:STATe?');
    response = query(RTB2004object, string);
    if contains(response,'1')
        string = sprintf('CHANnel1:DATA:POINts MAXIMUM');
        fprintf(RTB2004object, string);
        string = sprintf('CHANnel1:DATA?');
        response = query(RTB2004object, string);
        channel1data = str2num(response).';
        data(:,index) = channel1data;
        index = index+1;
    end
    
    % Channel 2 %
    string = sprintf('CHANnel2:STATe?');
    response = query(RTB2004object, string);
    if contains(response,'1')
        string = sprintf('CHANnel2:DATA:POINts MAXIMUM');
        fprintf(RTB2004object, string);
        string = sprintf('CHANnel2:DATA?');
        response = query(RTB2004object, string);
        channel2data = str2num(response).';
        data(:,index) = channel2data;
        index = index+1;
    end
    
    % Channel 3 %
    string = sprintf('CHANnel3:STATe?');
    response = query(RTB2004object, string);
    if contains(response,'1')
        string = sprintf('CHANnel3:DATA:POINts MAXIMUM');
        fprintf(RTB2004object, string);
        string = sprintf('CHANnel2:DATA?');
        string = sprintf('CHANnel3:DATA?');
        response = query(RTB2004object, string);
        channel3data = str2num(response).';
        data(:,index) = channel3data;
        index = index+1;
    end
    
    % Channel 4 %
    string = sprintf('CHANnel4:STATe?');
    response = query(RTB2004object, string);
    if contains(response,'1')
        string = sprintf('CHANnel4:DATA:POINts MAXIMUM');
        fprintf(RTB2004object, string);
        string = sprintf('CHANnel2:DATA?');
        string = sprintf('CHANnel4:DATA?');
        response = query(RTB2004object, string);
        channel4data = str2num(response).';
        data(:,index) = channel4data;
        index = index+1;
    end
    
end