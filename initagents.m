%Initagentsage
%Initialize agents population including age range
function a_str = initagentsage(size, s, visionv, buyout, metabolismv, c, percentAgents);
upper = (size/5)*3;
lower = size/5;
if(c == 1)
    for i = 1:size;
        for j = 1:size;

            if ((i<upper)&(j<upper)&(i>lower)&(j>lower)&(rand < percentAgents))
                a_str(i,j).active = 1; %put an agent on this location
                a_str(i,j).metabolism = ceil(rand * metabolismv);
                a_str(i,j).vision = ceil(rand * visionv);
                a_str(i,j).wealth = s(i,j)+5; 
                a_str(i,j).buyout = ceil(rand * buyout);

            else
                a_str(i,j).active = 0; %keep this location empty
                a_str(i,j).metabolism = 0;
                a_str(i,j).vision = 0;
                a_str(i,j).wealth = 0; 
                a_str(i,j).buyout = 0;

            end
        end
    end
elseif(c == 2)
    for i = 1:size;
        for j = 1:size;

            if (((i<(size-lower))&(j<(size-lower))&(i>(size-upper))&(j>(size-lower))&(rand < percentAgents)))
                b_str(i,j).active = 1; %put an agent on this location
                b_str(i,j).metabolism = ceil(rand * metabolismv);
                b_str(i,j).vision = ceil(rand * visionv);
                b_str(i,j).wealth = s(i,j); 
                b_str(i,j).buyout = ceil(rand * buyout);

            else
                b_str(i,j).active = 0; %keep this location empty
                b_str(i,j).metabolism = 0;
                b_str(i,j).vision = 0;
                b_str(i,j).wealth = 0; 
                b_str(i,j).buyout = 0;

            end
        end
    end
   
end
