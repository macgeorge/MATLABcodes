%%% Defines %%%%
clear all;
MX100TP_ip = '192.168.3.107';
DMM6500_ip = '192.168.3.15';
CurrentLimit = 0.5;

% Connect to MX100TP %
MX100TP = instrfind('Type', 'tcpip', 'RemoteHost', MX100TP_ip, 'RemotePort', 9221, 'Tag', '');
if isempty(MX100TP)
    MX100TP = tcpip(MX100TP_ip, 9221);
else
    fclose(MX100TP);
    MX100TP = MX100TP(1);
end
fopen(MX100TP);

% Connect to DMM6500%
DMM6500 = instrfind('Type', 'tcpip', 'RemoteHost', DMM6500_ip, 'RemotePort', 9221, 'Tag', '');
if isempty(DMM6500)
    DMM6500 = tcpip(DMM6500_ip, 5025);
else
    fclose(DMM6500);
    DMM6500 = DMM6500(1);
end
fopen(DMM6500);

%%%%% Setup DMM6500 %%%%%%
DMM6500_Setup(DMM6500, 'FUNC_DC_CURRENT', 1, 10, 10);
%%%%%%% End of Setup %%%%%

voltage = 0;
current_MX100 = 0;
current_DMM6500 = 0;

%%%%%%%%%%%%
disp('Start of Measurements');
M100TP_SetOutputValues(MX100TP, 1, 0, CurrentLimit); % Set current limit for Channel 1
M100TP_SetOutput(MX100TP,1,'ON');

close all;
figure();
f1 = subplot(2,1,1);
h1 = plot(voltage,current_MX100);
hold on;
h2 = plot(voltage,current_DMM6500);
xlabel('Voltage [V]'); ylabel('Current [mA]'); grid on; legend('MX100 Current','DMM6500 Current', 'location', 'southeast');
f2 = subplot(2,1,2);
h3 = plot(voltage,voltage*current_MX100);
hold on;
h4 = plot(voltage,voltage*current_DMM6500);
xlabel('Voltage [V]'); ylabel('Power [mW]'); grid on; legend('MX100 Power','DMM6500 Power', 'location', 'southeast');

for Voltage=0:0.2:35
    M100TP_SetOutputVoltage(MX100TP, 1, Voltage);
    fprintf('Voltage setpoint: %.1fV\n', Voltage);
    MilliPause(100);
    measvoltage = MX100TP_GetVoltage(MX100TP, 1);
    meascurrent_MX100 = MX100TP_GetCurrent(MX100TP, 1);
    meascurrent_DMM6500 = DMM6500_Read(DMM6500);
    voltage = [voltage measvoltage];
    current_MX100 = [current_MX100 meascurrent_MX100];
    current_DMM6500 = [current_DMM6500 meascurrent_DMM6500];
    set(h1, 'XData', voltage);
    set(h1, 'YData', current_MX100*1000);
    set(h2, 'XData', voltage);
    set(h2, 'YData', current_DMM6500*1000);
    set(h3, 'XData', voltage);
    set(h3, 'YData', voltage.*current_MX100*1000);
    set(h4, 'XData', voltage);
    set(h4, 'YData', voltage.*current_DMM6500*1000);
    drawnow;
end

disp('End of Measurements');
M100TP_SetOutputValues(MX100TP, 1, 0, 0);
M100TP_SetAllOutputs(MX100TP,'OFF');
fclose(MX100TP);
fclose(DMM6500);