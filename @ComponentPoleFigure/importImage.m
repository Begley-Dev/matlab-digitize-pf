function importImage(this)
%IMPORTIMAGE Summary of this function goes here
%   Detailed explanation goes here
    this.tim.load();
    this.tim.plot();
    this.bc = this.tim.center();
    this.requireTransform;
end

