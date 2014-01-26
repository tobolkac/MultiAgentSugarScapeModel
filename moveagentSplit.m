function a_str = moveagentSplit(a_str, s,temps, tempi, tempj,  visionv, buyout, metabolismv); 


%Agent moves to best location and updates wealth
    % Update wealth at new location
    a_str(tempi,tempj).active = 1; %put an agent on this location
    a_str(tempi,tempj).metabolism = ceil(rand * metabolismv);
    a_str(tempi,tempj).vision = ceil(rand * visionv);
    a_str(tempi,tempj).buyout = ceil(rand * buyout);
    a_str(tempi,tempj).wealth = a_str(tempi,tempj).wealth + temps - a_str(tempi,tempj).metabolism;
    % If wealth is less than zero set location to unoccupied
    if (a_str(tempi,tempj).wealth <= 0)
        a_str(tempi,tempj).active = 0; 
        a_str(tempi,tempj).vision = 0; 
        a_str(tempi,tempj).metabolism = 0; 
        a_str(tempi,tempj).wealth = 0;
    end
