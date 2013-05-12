function [K_S, V_T0] = transfer(filename)
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

p = polyfit(lin_Vd, lin_sqId, 1);

K_S = p(1)*p(1)*2/1.5;
V_T0 = -p(2)/p(1);

disp(['K_S: ' num2str(K_S)])
disp(['V_T0: ' num2str(V_T0)])

end

