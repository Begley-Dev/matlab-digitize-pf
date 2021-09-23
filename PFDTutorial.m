classdef PFDTutorial < handle
    %PFDTUTORIAL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        isOn = true;
    end
    
    methods
        function obj = PFDTutorial(varargin)
            %PFDTUTORIAL Construct an instance of this class
            %   creates an instance of the tutorial class, if logical is
            %   passed, set isOn to value of hte logical.
            
            if nargin > 0 && isa(varargin(1), 'logical')
                obj.isOn = varargin(1);
            end
            
        end
        
        function ToggleTutorial(obj)
            if obj.isOn
                obj.isOn = false;
            else
                obj.isOn = true;
            end
        end
        
        function bool = QueryTutorial(obj)
            bool = obj.isOn;
        end
        
        function Centering_1(obj)
            if obj.isOn
                waitfor(msgbox('Click the center of the pole figure, then the border (choose the widest point if the figure is skewed)', 'Tutorial','modal'));
            end
        end
        
        function Centering_2(obj)
            if obj.isOn
                waitfor(msgbox("Sorry, gotta find the center again and I didn't feel like mapping it, so repeat the process", 'Tutorial','modal'));
            end
        end
        
    end
end

