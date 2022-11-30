r = HEALPixS2Grid('resolution', 4*degree, 'upper');

for i=1:length(r(:))
x(i)=r(i).x; y(i)=r(i).y;
end

x = x*50;
y = y*50;

scatter(x,y)