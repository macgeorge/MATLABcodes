function result = MX100TP_GetVoltage(MX100TPobject, Output)

if Output==1 || Output==2 || Output==3

    string = sprintf('V%dO?', Output);
    response = query(MX100TPobject, string);
    index=strfind(response,'V');
    result = str2double(response(1:index-1));
    
else
    disp('Incorrect Output');
    return;
end

end