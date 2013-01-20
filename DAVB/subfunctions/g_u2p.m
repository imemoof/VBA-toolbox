function gx = g_u2p(x,P,u,in)
% generates the probability of picking 1 item among 2 from parameterized
% utility function

% alternatives
ac = u(in.iu(1)); % item 1
au = u(in.iu(2)); % item 2
if ~isempty(in.effort)
    k = exp(P(in.effort.P)); % effort cost per force unit
    c1 = -k*u(in.effort.iu(1)); % efort cost of item 1
    c2 = -k*u(in.effort.iu(2)); % efort cost of item 2
else
    c1 = 0;
    c2 = 0;
end
mu = x(1:in.n); % expectation (E[x] = mu)
dv = mu(ac) + c1 - ( mu(au) + c2 ); % relative value of item 1
b = exp(P(in.temp)); % behavioural temperature
gx = sig(dv/b); % probability of picking the first item

function s= sig(x)
s = 1./(1+exp(-x));
% s(s<1e-3) = 1e-3;
% s(s>1-1e-3) = 1-1e-3;