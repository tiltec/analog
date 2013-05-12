function [K_S, V_T0] = transfer(filename)
WL_ratio = 10;

rdoutput = importdata(filename);

Id = rdoutput.data(2:end,2);
Vd = rdoutput.data(2:end,1);

sqId = sqrt(Id);
d_sqId = diff(sqId);
%plot(Vd(1:end-1), d_sqId)

max_d_sqId = max(d_sqId);
err = 0.4*max_d_sqId;
lin_sqId = [];
lin_Vd = [];
for i = 1:length(d_sqId)
    if abs(max_d_sqId-d_sqId(i)) < err
        lin_sqId = [lin_sqId sqId(i)];
        lin_Vd = [lin_Vd Vd(i)];
    end
end
%plot(Vd,sqId)
%hold on
%plot(lin_Vd, lin_sqId, 'r')

[p,S] = polyfit(lin_Vd, lin_sqId, 1);
% fitness value
%http://www.mathworks.de/de/help/matlab/data_analysis/linear-regression.html
SStotal = (length(lin_sqId)-1)*var(lin_sqId); 
fitness = 1- (S.normr)^2/SStotal;

K_S = p(1)*p(1)*2/WL_ratio;
V_T0 = -p(2)/p(1);

%disp(['K_S: ' num2str(K_S) ', fitness: ' num2str(fitness)])
disp(['K_S: ' num2str(K_S)])
disp(['V_T0: ' num2str(V_T0)])

end

