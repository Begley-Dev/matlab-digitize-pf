function computePoleFigure(this, CS)
%COMPUTEPOLEFIGURE Summary of this function goes here
%   Detailed explanation goes here

r = HEALPixS2Grid('resolution', 5*degree, 'upper');

rPossibleContours = cell(1, length(r(:)));
rContours = zeros(1, length(r(:)));

for i = 1:length(rPossibleContours)
    rPossibleContours{i} = [this.baseline];
end

for iGrid = 1:length(r(:))
    
    x(iGrid)=r(iGrid).x*this.bc.a;
    y(iGrid)=r(iGrid).y*this.bc.a;
    
    for iCLS = 1:length(this.cls)
        if this.cls{iCLS}.isInLayer(x(iGrid),y(iGrid))
            rPossibleContours{iGrid}(end+1) = this.cls{iCLS}.contourLevel;
        end
    end
end

for i = 1:length(rPossibleContours)
    minimum = min(rPossibleContours{i});
    maximum = max(rPossibleContours{i});
    
    if minimum < this.baseline && maximum > this.baseline
        rContours(i) = this.baseline;
    elseif minimum < this.baseline
        rContours(i) = minimum;
    elseif maximum > this.baseline
        rContours(i) = maximum;
    else
        rContours(i) = this.baseline;
    end
end

[theta, rho,~] = r.polar;

size(theta)
size(rho)
size(rContours)


T = table(theta, rho, rContours');
writetable(T, [num2str(this.pole.h) num2str(this.pole.k) num2str(this.pole.l) '.csv']);

fname = [pwd filesep num2str(this.pole.h) num2str(this.pole.k) num2str(this.pole.l) '.csv'];
this.pf = loadPoleFigure_generic(fname, 'radians', 'delimiter', ',',...
'ColumnNames',{'polar angle','azimuth angle','intensity'},...
'Columns',[1 2 3], this.pole);


end

