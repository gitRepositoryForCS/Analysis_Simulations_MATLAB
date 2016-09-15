root1 = -1;
root2 = 1;
root3 = -1i;
root4 = 1i;
color = zeros(1334, 1334, 4); !
[X,Y] = meshgrid(-1:0.0015:1, -1:0.0015:1);
z0 = X + Y.*1i;
z = mynewtonmethod(z0);
eps=0.01* ones(1334);
red(abs((z - root1).^2) <= eps) = 1;
green(abs((z - root2).^2) < eps) = 1;
blue(abs((z - root3).^2) < eps) = 1;
purple(abs((z - root4).^2) < eps) = 1; !
color(:,:,1) = reshape(red,[1334,1334]);
color(:,:,2) = green;
color(:,:,3) = blue;
color(:,:,4) = purple; !
image(color);