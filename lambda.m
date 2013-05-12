function l = lambda(filename)
rdoutput = importdata(filename);

Id = rdoutput.data(2:end,2);
Vd = rdoutput.data(2:end,1);

%figure(1)
%clf;
%plot(Vd,Id);

steig = diff(Id);
%plot(Vd(1:end-1),steig)
min_steig = min(steig);

err = 0.1*min_steig;
lin_Vd = [];
lin_Id = [];
for i = 1:length(steig)
    if abs(min_steig-steig(i)) < err
        lin_Vd = [lin_Vd Vd(i)];
        lin_Id = [lin_Id Id(i)];
    end
end
p = polyfit(lin_Vd, lin_Id, 1);
disp(['lambda: ' num2str( p(1)/p(2) )])
l = p(1)/p(2);

end