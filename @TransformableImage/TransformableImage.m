classdef TransformableImage <handle
    %TransformableImage Summary of this class goes here
    %   Functions like a MATLAB image, but has custom transformations for
    %   my own sanity
    
    properties
        im; %MATLAB Image
        cross;
    end
    
    methods
        
        function this = TransformableImage()
            %UNTITLED3 Construct an instance of this class
            %   Detailed explanation goes here
        end
        
        load(this)
        bc = findCenter(this)
        transform(this, bc)
        moveToOrigin(this,bc)
        ax = plot(this)
        
    end
end

