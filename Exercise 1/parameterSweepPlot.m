Rin = 5; % Input resistance in MOhm
tau = 10; % membrane time constant in ms
theta = 4; % threshold in mV

Rins = [3 5 10];
taus = [5 10 15];
thetas = [2 4 8];

% Create figure
fig = gcf;
fig.PaperUnits = "inches";
fig.PaperPosition = [0 0 6 5];

legends = [];
for n = 1 : 3
    tspike = noisyifneuron(tau,theta,Rins(n));
    hold on;
    asp = round(mean(isi(tspike))); % mean spike interval time 
    if isnan(asp)
        asp = 0;
    end
    legendentry =  "Rin="+Rins(n)+", mean spike interval time="+asp;
    legends = [legends, legendentry];
end

% Make it look decent
title("Rin parameter sweep");
legend(legends);
ylim([0 5]);
ylabel("Voltage (mV)"); % Set the y axis label
xlabel("Time (ms)"); % Set the x axis label

% Save the plot to image
saveas(gcf, "rinValues.png"); 
clf(fig, 'reset') % reset plot
hold off;

% Create figure
fig = gcf;
fig.PaperUnits = "inches";
fig.PaperPosition = [0 0 6 5];

legends = [];
for n = 1 : 3
    tspike = noisyifneuron(taus(n),theta,Rin);
    hold on;
    asp = round(mean(isi(tspike))); % mean spike interval time 
    if isnan(asp)
        asp = 0;
    end
    legendentry =  "tau="+taus(n)+", mean spike interval time="+asp;
    legends = [legends, legendentry];
end

% Make it look decent
title("tau parameter sweep");
legend(legends);
ylim([0 5]);
ylabel("Voltage (mV)"); % Set the y axis label
xlabel("Time (ms)"); % Set the x axis label

% Save the plot to image
saveas(gcf, "tauValues.png"); 
clf(fig, 'reset') %reset plot

% Create figure
fig = gcf;
fig.PaperUnits = "inches";
fig.PaperPosition = [0 0 6 5];

legends = [];
for n = 1 : 3
    tspike = noisyifneuron(tau,thetas(n),Rin);
    hold on;
    asp = round(mean(isi(tspike))); % mean spike interval time 
    if isnan(asp)
        asp = 0;
    end
    legendentry =  "theta="+thetas(n)+", mean spike interval time="+asp;
    legends = [legends, legendentry];
end

% Make it look decent
title("tau parameter sweep");
legend(legends);
ylim([0 5]);
ylabel("Voltage (mV)"); % Set the y axis label
xlabel("Time (ms)"); % Set the x axis label

% Save the plot to image
saveas(gcf, "thetaValues.png"); 
clf(fig, 'reset') %reset plot