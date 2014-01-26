function [temps, tempi, tempj] = seeSplit(i,j,k,a_str, b_str,s,size);


found = false;
while (found == false)
    south = [i+k  size  i+k-size  j  i+k  j];
north = [k-i  -1  i-k+size  j  i-k  j];
east  = [j+k  size  i  j+k-size  i  j+k];
west  = [k-j  -1  i  j-k+size  i  j-k];

c{1} = south;  c{2} = north;  c{3} = east;  c{4} = west;
    for m = randperm(4);

        if (c{m}(1) > c{m}(2))
            u = c{m}(3);
            v = c{m}(4);
            if (b_str(u,v).active == 0 & a_str(u,v).active == 0)
               temps = s(u,v);
               tempi = u;
               tempj = v;
               found = true;
            end
        else    
            u = c{m}(5);
            v = c{m}(6);
            if (b_str(u,v).active == 0 & a_str(u,v).active == 0)
               temps = s(u,v);
               tempi = u;
               tempj = v;
               found = true;
            end
        end

    end
    k = k+1;
    
end