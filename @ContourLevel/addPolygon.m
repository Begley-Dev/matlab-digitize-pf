function addPolygon(this)
%ADDPOLYGON Summary of this function goes here
%   Detailed explanation goes here
vert_x = [];
vert_y = [];

n = 1;

while n == true
    
    [x, y, button] = ginput(1);
    
    if button == 1
        
        this.dotHandles(end+1) = Helper.plotDot(gca, x, y, 5, [0 0 1]);
        vert_x(end+1) = x;
        vert_y(end+1) = y;
        
    elseif button == 28
        
        delete(this.dotHandles(end));
        this.dotHandles(end) = [];
        
    else
        n = false;
    end
end

x = input('IntersectsEdge? (y/n)', 's');
intersectsEdge = (strcmp(x,'y') || strcmp(x,'Y') || strcmp(x,'yes') || strcmp(x, 'Yes') || strcmp(x,'YES'));

if intersectsEdge
    q1 = Helper.findQuadrant(vert_x(1), vert_y(1))
    q2 = Helper.findQuadrant(vert_x(end), vert_y(end))
    
    xLim = xlim(gca);
    yLim = ylim(gca);
    
    if (q1 == q2)
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(q1, xLim, yLim);
    elseif (q1 ~= q2 && Helper.isQuadrantNeighbor(q1,q2))
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(q2, xLim, yLim);
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(q1, xLim, yLim);
    else
        x = input('Which quadrant makes the polygon correct (gimme a number 1-4', 's');
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(q2, xLim, yLim);
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(num2str(x), xLim, yLim);
        [vert_x(end+1), vert_y(end+1)] = Helper.findQuadrantCorner(q1, xLim, yLim);
    end
    
end

this.polygons{end+1} = polyshape(vert_x, vert_y);

clear vert_x vert_y;
delete(this.dotHandles);
this.dotHandles = [];

hold on;
this.polygons{end}.plot;
hold off;

end

