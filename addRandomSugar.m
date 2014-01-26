%add random sugar to sugarscape
function [s, a_str] = addRandomSugar(s, a_str, size, maxsugar);

for a = 1:2
    
    randx = ceil(rand*size)+1;
    if(randx<0)
        randx=0;
    end
    randy = ceil(rand*size)+1;
    if(randy<0)
        randy=0;
    end

    for e = -1:1
        for r = -1:1
            if(a_str(randx+e,randy+r).active == 1)
                a_str(randx+e,randy+r).wealth = a_str(randx,randy).wealth + maxsugar/2;
            else
                s(randx+e, randy+r) = maxsugar/2;
            end
        end
    end
end


