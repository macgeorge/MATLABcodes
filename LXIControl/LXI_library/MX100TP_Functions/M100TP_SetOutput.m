function result = M100TP_SetOutput(MX100TPobject, Output, Value)

if strcmp(Value, 'On') || strcmp(Value, 'ON') || strcmp(Value, 'on') || strcmp(Value, '1')
    command=1;
elseif strcmp(Value, 'Off') || strcmp(Value, 'OFF') || strcmp(Value, 'off') || strcmp(Value, '0')
    command=0;
else
    disp('Incorrect command')
    return
end

string = sprintf('OP%d %d', Output, command);
fprintf(MX100TPobject, string);
result=0;
end