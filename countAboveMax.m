%add random sugar to sugarscape
function [count, a_str] = countAboveMax(a_str, b_str, size, s,  visionv, buyoutA, metabolismv);
count = 0;
    for x = 1:size
        for y = 1:size
            if (a_str(x, y).wealth >= (size/3))
                w = a_str(x, y).wealth;
                a_str(x, y).wealth = w/2;
                for p = a_str(x,y).vision : -1 : 1;  
                    [tempsB, tempiB, tempjB] = seeSplit(x,y,p,a_str, b_str,s, size);                 
                end
                a_str = moveagentSplit(a_str, s,tempsB, tempiB, tempjB,  visionv, buyoutA, metabolismv);
            elseif(a_str(x,y).wealth >= (size/5))
                count = count + 1;
                a_str(x,y).wealth = a_str(x,y).wealth * 1.5;
            
            end
        end
    end

