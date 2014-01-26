%Neighbor
function [temps, tempi, tempj] = neighbor(u,v,a_str, b_str,s,temps,tempi,tempj,origi,origj, enableBuyout, side);

if (side == 1)
    %no agent at location
    if (b_str(u,v).active == 0 & a_str(u, v).active == 0)

        if (s(u,v) >= temps)
            temps = s(u,v);
            tempi = u;
            tempj = v;  
        end
    %agent from other side at location
    elseif (b_str(u,v).active == 1 & enableBuyout == 1)
         if (a_str(origi,origj).wealth >= (b_str(u,v).wealth*b_str(u,v).buyout))
             %gain = a_str(origi,origj).wealth - a_str(u,v).wealth
             if((s(u,v)) >= temps)
                 temps = s(u,v);
                 tempi = u;
                 tempj = v;
             end
         end
    %agent from same side at location
    elseif (a_str(u,v).active == 1 & enableBuyout == 1)
        if (a_str(origi,origj).wealth >= (a_str(u,v).wealth*a_str(u,v).buyout))
             %gain = a_str(origi,origj).wealth - a_str(u,v).wealth
             if((s(u,v)) >= temps)
                 temps = s(u,v);
                 tempi = u;
                 tempj = v;
             end
         end
    end
end
if (side == 2)
    %no agent at location
    if (b_str(u,v).active == 0 & a_str(u, v).active == 0)

        if (s(u,v) >= temps)
            temps = s(u,v);
            tempi = u;
            tempj = v;  
        end
    %agent from other side at location
    elseif (a_str(u,v).active == 1 & enableBuyout == 1)
         if (b_str(origi,origj).wealth >= (a_str(u,v).wealth*a_str(u,v).buyout))
             %gain = a_str(origi,origj).wealth - a_str(u,v).wealth
             if((s(u,v)) >= temps)
                 temps = s(u,v);
                 tempi = u;
                 tempj = v;
             end
         end
    %agent from same side at location
    %buyout if on same side
    elseif (b_str(u,v).active == 1 & enableBuyout == 1)
        if (b_str(origi,origj).wealth >= (b_str(u,v).wealth*b_str(u,v).buyout))
             %gain = a_str(origi,origj).wealth - a_str(u,v).wealth
             if((s(u,v)) >= temps)
                 temps = s(u,v);
                 tempi = u;
                 tempj = v;
             end
         end
    end
end