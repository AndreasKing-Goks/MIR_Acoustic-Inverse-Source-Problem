function R_sum = Green_Function(sig,xr,zr,xs,zs,dt,n_reflect,Zseabed,c0)
R_sum = 0;
for j = -n_reflect : n_reflect
    if mod(j,2) == 0
        rj = sqrt((xr-xs).^2+(zr-zs+(j*Zseabed)).^2);
        e = 1;
    else
        rj = sqrt((xr-xs).^2+(zr+zs-((j+1)*Zseabed)).^2);
        e = -1;
    end
    delay = rj/c0;
    fs = 1/dt;
    shift_sig = delayseq(sig', delay, fs);
    R = -e * shift_sig / (4*pi*rj);
    
    R_sum = R_sum + R;
end;
R_sum = R_sum';
end