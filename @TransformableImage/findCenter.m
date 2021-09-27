function bc = findCenter(this)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    %invokeTutorial('1');
    
    ax = gca;
    
    % get center
    [cx,cy] = ginput(1);
    
    hold on;
    center = plot(ax, cx, cy, 'ro', 'MarkerSize', 10, 'Color', [1 0 0]);
    hold off;
            
    [ex,ey] = ginput(1);
    hold on;
    edge = plot(ax, ex, ey, 'ro', 'MarkerSize', 10, 'Color', [1 0 0]);
    hold off;
    
    radius = norm([cx cy] - [ex ey]);
    
    %bc = BoundaryCircle(cx,cy,radius,0:0.01:2*pi);
    %bc.plot(ax);
    
    delete(center);
    delete(edge);
    
    pad = 1.2;
    this.im = imcrop(this.im, [cx-radius*pad cy-radius*pad cx+radius*pad cy+radius*pad]);
    %this.im = flip(this.im, 1);
    
    close;
    %delete(bc.handle);
    
    ax = this.plot();
    xlim(ax,[cx-radius*pad cx+radius*pad])
    ylim(ax,[cy-radius*pad cy+radius*pad])
    
    %app.bc.plot(app.ax);
    
    %invokeTutorial('2');
    
    % get center
    [cx,cy] = ginput(1);
    
    hold on;
    center = plot(ax, cx, cy, 'ro', 'MarkerSize', 10, 'Color', [1 0 0]);
    hold off;
            
    [ex,ey] = ginput(1);
    hold on;
    edge = plot(ax, ex, ey, 'ro', 'MarkerSize', 10, 'Color', [1 0 0]);
    hold off;
    
    radius = norm([cx cy] - [ex ey]);
    
    bc = BoundaryCircle(cx,cy,radius,0:0.01:2*pi);
    bc.plot(ax);

end

