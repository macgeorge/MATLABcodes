function result = DMM6500_Read(DMM6500object)

string = sprintf('print(dmm.measure.read())');
response = query(DMM6500object, string);
result = str2double(response);

end

