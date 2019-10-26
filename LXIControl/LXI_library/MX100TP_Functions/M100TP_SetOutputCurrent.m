function result = M100TP_SetOutputValues(MX100TPobject, Output, Current)

%Set Current %
string = sprintf('I%d %.3f', Output, Current);
fprintf(MX100TPobject, string);

result = 0;
end