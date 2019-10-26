function result = MX100TP_GetCurrent(MX100TPobject, Output)

if Output==1 || Output==2 || Output==3

    string = sprintf('I%dO?', Output);
    response = query(MX100TPobject, string);
    index=strfind(response,'A');
    result = str2double(response(1:index-1));
    
else
    disp('Incorrect Output');
    return;
end

end