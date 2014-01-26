%Sugarscape1
%sugarscape: (two-peak sugarscape, rule: Ginf)
%agents: (moving sequence: random, view: four directions, rule: M)

clear all;
clc;

%Initialize model parameters
nruns =12; 
size = 100; %even number
metabolismv = 4;
%buyout = 1;
enableBuyout = 1;
visionv = 6; %set always smaller than size
maxsugar = 20;
buyoutCount = 0;
percentAgentsA = .25;
percentAgentsB = .5;
buyoutA = 5;
buyoutB = 3;

%Initialize sugarscape and display 
s = initsugarscape(nruns, size, maxsugar);

%Initialize agents population 

a_str = initagents(size, s, visionv, buyoutA, metabolismv, 1, percentAgentsA);

b_str = initagentsB(size, s, visionv, buyoutB, metabolismv, 2, percentAgentsB);



%Main loop (runs)
for runs = 1:nruns;

    %Display agents locations 
   
	dispagentloc(a_str,b_str, size, nruns, runs);
    
    %regen agents at these new spots if empty
    [countA, a_str] = countAboveMax(a_str, b_str, size, s, visionv, buyoutA, metabolismv );
    [countB, b_str] = countAboveMax(b_str,a_str,  size, s,  visionv, buyoutB, metabolismv);
    %[s, a_str] = addRandomSugar(s, a_str, size, maxsugar);
    
	%Select agents in a random order and move around the sugarscape following rule M
    for i = randperm(size);
        t = randperm(size);
        for j = randperm(size);
            c = randperm(size); 
            %move a_str agents
            if (a_str(i,j).active == 1) %is there an agent on this location?
  
                %Agent explores sugarscape in random directions and selects best location
                tempsA = s(i,j);  
                tempiA = i;  
                tempjA = j;
                origiA = i;
                origjA = j;
               
                for k = a_str(i,j).vision : -1 : 1;  
                    [tempsA, tempiA, tempjA] = see(i,j,k,a_str, b_str,s,size,tempsA,tempiA,tempjA,origiA,origjA, enableBuyout, 1);                 
                end
                
                %Agent moves to best location, updates sugar stock and eats sugar
                a_str = moveagent(a_str, s, i, j, tempsA, tempiA, tempjA);                 
            end       % if
            %move b agents around
            if (b_str(i,j).active == 1) %is there an agent on this location?
  
                %Agent explores sugarscape in random directions and selects best location
                tempsB = s(i,j);  
                tempiB = i;  
                tempjB = j;
                origiB = i;
                origjB = j;
               
                for w = b_str(i,j).vision : -1 : 1;  
                    [tempsB, tempiB, tempjB] = see(i,j,w,a_str, b_str,s,size,tempsB,tempiB,tempjB,origiB,origjB, enableBuyout, 2);                 
                end
                
                %Agent moves to best location, updates sugar stock and eats sugar
                b_str = moveagent(b_str, s, i, j, tempsB, tempiB, tempjB);                 
            end       % if 
            
        end           % for j
    end               % for i
    
end                   % for runs