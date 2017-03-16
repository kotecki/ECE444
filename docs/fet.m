% Matlab m-file for ECE 444 FET analysis

% add ngspice matlab toolbox to the path
addpath('/users/Kotecki/CppSim/CppSimShared/HspiceToolbox');

% set format; clear variables; access the test.hspc file
format long;
clear variables;
hspc_filename = sprintf('fet.hspc');

% set test.hspc paramaters: vds, nmos_l, nmos_w and m
hspc_set_param('vds', 1.5, hspc_filename);
hspc_set_param('nmos_l', 65e-9, hspc_filename);
hspc_set_param('nmos_w', 200e-9, hspc_filename);
hspc_set_param('nmos_m', 1, hspc_filename);

% set figure size and location
FigHandle = figure('Position', [200, 75, 850, 600]);
% turn on grid and hold
grid on;
hold on;

% for loop to generate IDS vs VDS for values of VGS
for i = .2:.2:1.2
    % set value of vgs
    hspc_set_param('vgs', i, hspc_filename);
    % set legend name
    legendname = sprintf('Vgs = %0.1fV',i);
    % run ngspice
    ngsim(hspc_filename);
    % load simulation results and extract vds and ids
    data = loadsig('simrun.raw');
    vds = evalsig(data,'VOLTAGE');
    ids = evalsig(data, 'i_vds');
    igs = evalsig(data, 'i_vgs');
    % plot ids vs vds
    plot(vds, -1E3*ids, 'linewidth',2.0, 'displayname', legendname)
end
hold off;

% increase font size
set(gca, 'fontsize', 16);
legend show
% x- and y-axis labels
xlabel('Vds (V)', 'fontsize', 16);
ylabel('Ids (mA)', 'fontsize', 16);

% end of M file