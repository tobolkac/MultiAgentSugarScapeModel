%Dispagentloc
%Transform field "agent" from data structure into matrix and display agents locations    
function dispagentloc(a_str, b_str, size, nruns, runs);
a = zeros(size); av = zeros(size); am = zeros(size);
b = zeros(size); bv = zeros(size); bm = zeros(size);

for i = 1:size;
    for j = 1:size;
        if (a_str(i,j).active == 1)
	        a(i,j) = a_str(i,j).active;
            av(i,j) = a_str(i,j).vision;
            am(i,j) = a_str(i,j).metabolism;
        end
    end
end

for i = 1:size;
    for j = 1:size;
        if (b_str(i,j).active == 1)
	        b(i,j) = b_str(i,j).active;
            bv(i,j) = b_str(i,j).vision;
            bm(i,j) = b_str(i,j).metabolism;
        end
    end
end


figure(2);

subplot(ceil(sqrt(nruns)),ceil(sqrt(nruns)),runs), spy(b);
hold on
subplot(ceil(sqrt(nruns)),ceil(sqrt(nruns)),runs), spy(a, 'r');

hold off
axis square;



avgvision = sum(sum(av))/sum(sum(a))
avgmetabolism = sum(sum(am))/sum(sum(a))
numA = nnz(a)
runs

bvgvision = sum(sum(bv))/sum(sum(b))
bvgmetabolism = sum(sum(bm))/sum(sum(b))
numB = nnz(b)
runs