clc
clear

%% Input Variables
K = createStiffnessMatrix('DMIG.pch');
M = createMassMatrix('DMIG.pch');
F = [100000;0;0;0;0;0];

%%
% [eigenVectors,eigenValues] = eig(K,M)

[r,c] = size(M)

% Solution 1
syms l
eig_problem = det(K-l.*M);
gamma = solve(eig_problem ==0, l);
num_of_eig_values = length(gamma)
u = zeros(r,num_of_eig_values);
for j=1:length(gamma)
    u(:,j) = null(K-gamma(j).*M);  %eigenvectors
end



% % norm_eigenvectors = normc(eigenVector)
wn_rad = vpa(sqrt(gamma),3); % Natural Frequency in Hz
wn_hz = vpa(sqrt(gamma)./(2*pi),3); % Natural Frequency in Hz

% % In the MIT Lecture Video they normalize by the first row
% for j=1:length(gamma)
%     u(:,j) = u(:,j)/u(1,j);  %eigenvectors
% end
 
Mg = u'*M*u
Kg = u'*K*u
Fg = u'*F

first_freq = 0;
last_freq = 2000;
sensitivity = 1;
index=1;
syms t
for w=0:100:100000
    A = (-w^2.*Mg+Kg);
   b = Fg;
   Z = A\b;
   vpa(u*Z*exp(i*w*t),2);
   x(:,index) = u*Z*exp(1i*w);
%    mag = abs(x)
%    phase = angle(x)
   index = index+1;
end
    
    
   mag = abs(x);
   phase = angle(x);
   
   
      
   
   input=0:100:100000;
   plot(input,mag(1,:))
   
   

