function moveToOrigin(this,bc)
%MOVETOORIGIN Summary of this function goes here
%   Detailed explanation goes here

%vector = [0-bc.x0, 0-bc.y0];
% this.im = imtranslate(this.im, vector, 'FillValues',255,'OutputView','full');
% %ax = this.plot();
% delete(bc.handle);
% ax = gca;
% xlim(ax, [0-bc.a, 0+bc.a])
% ylim(ax, [0-bc.a, 0+bc.a])
close;

bc.x0 = 0;
bc.y0 = 0;

x = [0-bc.a, 0+bc.a]; y=x;
%this.im = flip(this.im, 1);
this.im = imagesc(x,y, this.im);

ax = gca;
axis(ax, 'image');
set(ax, 'Ydir','normal')

bc.plot(ax);



end

