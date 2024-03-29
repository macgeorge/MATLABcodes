function DMM6500_Setup(DMM6500object, measurefunction, NPLC, count, filtercount)

if ...
        strcmp(measurefunction, 'FUNC_DC_VOLTAGE') || ...
        strcmp(measurefunction, 'FUNC_AC_VOLTAGE') || ...
        strcmp(measurefunction, 'FUNC_DC_CURRENT') || ...
        strcmp(measurefunction, 'FUNC_AC_CURRENT') || ...
        strcmp(measurefunction, 'FUNC_TEMPERATURE') || ...
        strcmp(measurefunction, 'FUNC_RESISTANCE') || ...
        strcmp(measurefunction, 'FUNC_4W_RESISTANCE') || ...
        strcmp(measurefunction, 'FUNC_DIODE') || ...
        strcmp(measurefunction, 'FUNC_CAPACITANCE') || ...
        strcmp(measurefunction, 'FUNC_CONTINUITY') || ...
        strcmp(measurefunction, 'FUNC_ACV_FREQUENCY') || ...
        strcmp(measurefunction, 'FUNC_ACV_PERIOD') || ...
        strcmp(measurefunction, 'FUNC_DCV_RATIO')

    string = sprintf('dmm.measure.func = dmm.%s', measurefunction);
    fprintf(DMM6500object, string);

    string = sprintf('dmm.measure.count = %d', count);
    fprintf(DMM6500object, string);

    string = sprintf('dmm.measure.filter.count = %d', filtercount);
    fprintf(DMM6500object, string);

    string = sprintf('dmm.measure.nplc = %d', NPLC);
    fprintf(DMM6500object, string);

    string = sprintf('dmm.measure.filter.type = dmm.FILTER_MOVING_AVG');
    fprintf(DMM6500object, string);
    string = sprintf('dmm.measure.filter.enable = dmm.ON');
    fprintf(DMM6500object, string);

else
    disp('Incorrect measuring function');
    return
end

end

