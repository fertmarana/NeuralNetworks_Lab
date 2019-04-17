function plotNeuron = noisyifneuron(tau,theta,Rin)
nstep = 100; % Number of timesteps to integrate over
Inoise = 0.1;
I0 = 1+Inoise*randn(1,nstep); % Input current in nA
dt = 1; % time step in ms
%tau = 10; % membrane time constant in ms
%theta = 4; % threshold in mV
v = zeros(1,nstep);
%Rin = 5; % Input resistance in MOhm
tspike = [];
t = (1:nstep)*dt;
for n=2:nstep
v(n) = v(n-1) + dt*(- v(n-1)/tau + Rin*I0(n)/tau);
if (v(n) > theta)
v(n) = 0;
tspike = [ tspike t(n) ];
end
end
plot(t,v)
end