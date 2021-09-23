classdef ComponentPoleFigure <handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pf; %MTEX PoleFigure
        tim = TransformableImage; %TransformableImage
        cls = {}; %cell array of contour levels
        bc; %boundary circle
    end
    
    methods
        function this = ComponentPoleFigure()
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
        end
        
        importImage(this)
        requireTransform(this)
        
    end
end

