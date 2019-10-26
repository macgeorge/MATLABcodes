close all;
clear all;
RTB2004_ip = '192.168.2.11';
% Connect to RTB2004%
RTB2004 = instrfind('Type', 'tcpip', 'RemoteHost', RTB2004_ip, 'RemotePort', 5025, 'Tag', '');
if isempty(RTB2004)
    RTB2004 = tcpip(RTB2004_ip, 5025);
else
    fclose(RTB2004);
    RTB2004 = RTB2004(1);
end
set(RTB2004, 'InputBufferSize', 100000000);
fopen(RTB2004);

RTB2004_singleshot(RTB2004);
RTB2004_screenshot(RTB2004, 't2');
RTB2004_saveCSV(RTB2004, 'wvfm');

scopedata = RTB2004_getData(RTB2004);

fclose(RTB2004);

plot(scopedata(:,1), scopedata(:,2), scopedata(:,1), scopedata(:,3));
title('Scope Waveform');
legend('CH1','CH2', 'location', 'southeast');
grid on;
xlabel('Time [s]');
ylabel('Voltage [V]');
xlim([scopedata(1,1) scopedata(end,1)]);