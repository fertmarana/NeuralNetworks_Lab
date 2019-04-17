I0 = 1; % Input current in nA
dt = 1; % time step in ms
tau = 10; % membrane time constant in ms
theta = 4; % threshold in mV
nstep = 100; % Number of timesteps to integrate over
v(1) = 0; % Voltage in mV
Rin = 5; % Input resistance in MOhm
tspike = []; % place to store spike times
t = (1:nstep)*dt;
v(1) = 0; % Voltage in mV
v = zeros(1,nstep); % Allocate space for voltage in mV
for n=2:nstep

v(n) = v(n-1) + dt*(- v(n-1)/tau + Rin*I0/tau);

if (v(n) > theta)
v(n) = 0;
tspike = [tspike t(n)];
end
end
plot(t,v)