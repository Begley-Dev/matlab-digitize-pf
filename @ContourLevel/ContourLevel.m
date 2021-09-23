classdef ContourLevel < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        contourLevel = 0;
        center = [];
        polygons = {};
        contourVertX = [];
        contourVertY = [];
    end
    
    methods
        function obj = Layer(contourLevel)
            obj.contourLevel = contourLevel;
        end
        
        function addPolygon(obj, polygon)
            obj.polygons{end+1} = polygon;
        end
        
        %         function addPolygon(obj, polygon)
        %             obj.contourVertX(:,end+1) = polygon.Vertices(:,1);
        %             obj.contourVertY(:,end+1) = polygon.Vertices(:,2);
        %             disp(polygon);
        %             obj.contourLevel = polygon(1,1);
        %         end
        
        function isInLayer = isInLayer(obj, x,y)
            isInLayer = false;
            for i = length(obj.polygons)
                pgon = obj.polygons{i};
                TFin = isinterior(pgon, x, y);
                if TFin
                    isInLayer = true;
                end
            end
        end
        
        function plot(obj)
            for i = 1:length(obj.polygons)
                hold on
                plot(obj.polygons{i})
                hold off
            end
        end
        
    end
end



