function result = M100TP_SetOutputValues(MX100TPobject, Output, Voltage, Current)

% Set Voltage %
string = sprintf('V%d %.3f', Output, Voltage);
fprintf(MX100TPobject, string);

%Set Current %
string = sprintf('I%d %.3f', Output, Current);
fprintf(MX100TPobject, string);

result = 0;
end