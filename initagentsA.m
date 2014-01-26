%Initagentsage
%Initialize agents population including age range
function a_str = initagentsage(a_str, size, s, visionv, buyout, metabolismv);
for i = 1:size;
    for j = 1:size;
        
        if ((i<60)&(j<60)&(i>20)&(j>20)&(rand < 0.2))
            a_str(i,j).active = 1; %put an agent on this location
            a_str(i,j).metabolism = ceil(rand * metabolismv);
            a_str(i,j).vision = ceil(rand * visionv);
            a_str(i,j).wealth = s(i,j); 
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

