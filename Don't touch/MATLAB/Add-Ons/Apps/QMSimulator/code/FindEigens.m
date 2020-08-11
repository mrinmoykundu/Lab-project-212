function [Es, psis] = FindEigens(H, desired_mode_num)


[psis, Es] = eig(H);

[Es,ind] = sort(diag(Es));% convert E to vector and sort low to high
psis = psis(:,ind); % rearrange corresponding eigenvectors

Es = Es(1:desired_mode_num);
psis = psis(:,1:desired_mode_num);

end

