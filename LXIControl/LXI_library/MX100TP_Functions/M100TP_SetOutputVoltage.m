function result = M100TP_SetOutputVoltage(MX100TPobject, Output, Voltage)

string = sprintf('V%d %.3f', Output, Voltage);
fprintf(MX100TPobject, string);

result=0;
end