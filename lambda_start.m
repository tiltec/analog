clc;
filelist = dir('pmos_vdd*');

for f = filelist'
    disp(f.name)
    lambda(f.name);
end

filelist = dir('nmos_vdd*');

for f = filelist'
    disp(f.name)
    lambda(f.name);
end