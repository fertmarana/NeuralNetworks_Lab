Rin = 5; % Input resistance in MOhm
tau = 10; % membrane time constant in ms
theta = 4; % threshold in mV

tspike = noisyifneuron(tau,theta,Rin); 

asp = round(mean(isi(tspike))); % mean spike interval time 

% Create figure
fig = gcf;
fig.PaperUnits = "inches";
fig.PaperPosition = [0 0 6 3];

% Make it look decent
title("Rin="+Rin+", tau="+tau+", theta="+theta+", mean spike interval time="+asp);
ylim([0 5]);
ylabel("Voltage (mV)"); % Set the y axis label
xlabel("Time (ms)"); % Set the x axis label

% Save the plot to image
saveas(gcf, "defaultValues.png"); 