%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Command statements
%      VIDEO: Random count-down timer (Poisson-like)
% Instructor: mikexcohen.com

%%

% set threshold
thresh =  exp(-10)  % this is usually e to "the something" in poisson processes 
nRep = 100
% initialize initial value
[currval,startval] = deal( 10 ); % deal will distribute the number 10 to both variables 

% decay process
decayvar = nan(nRep,1000); % nan instead of zeros because this eliminates the trailing zeros 


currval = startval;
% we want to avg the decay variable over a set number of iterations  (100)
% for example 

for irep = 1:nRep
    % we need to reset the currval for each iteration
    currval = startval;
    % we need to reset the counter
    counter = 0;
    % stay in loop as long as needed
    while currval>thresh
        
        % increase counter
        counter = counter +1
        
        % decrease target by random fraction ([0 1])
        currval = currval * rand^(0.5) ;  % rand will generate randomly distributed numbers between zero and one
        
        % update decay variable
        decayvar(irep,counter+1) = currval;
    end
end
% plot the results
figure(1), clf
plot(nanmean(decayvar,1),'ks-','linew',2,'markersize',15,'markerfacecolor','w')
xlabel('Iterations'), ylabel('Value')
title([ num2str(counter) ' iterations until threshold' ])

%%
