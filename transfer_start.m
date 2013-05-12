clc; clear all;
filelist = dir('pmos_vgs*');

for f = filelist'
    disp(f.name)
    transfer(f.name);
end

filelist = dir('nmos_vgs*');

for f = filelist'
    disp(f.name)
    transfer(f.name);
end