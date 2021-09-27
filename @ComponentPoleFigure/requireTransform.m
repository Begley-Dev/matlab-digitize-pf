function requireTransform(this)
%REQUIRETRANSFORM Summary of this function goes here
%   Detailed explanation goes here
x = input('Needs transform (y/n)', 's');

if (strcmp(x,'y') || strcmp(x,'Y') || strcmp(x,'yes') || strcmp(x, 'Yes') || strcmp(x,'YES'))
    this.tim.transform(this.bc);
    this.bc = this.tim.findCenter;
    this.requireTransform;
else
    return
end

end

