classdef HierarchicalODF < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ODF;
        CPFs = {}; %cell array of constituent pole figures
        CS;
        kernel; %kernel
        
    end
    
    methods
        function this = HierarchicalODF()
            %HierarchicalODF Construct an instance of this class
            %   Detailed explanation goes here
        end
    end
    
    methods(Static)
        function kernels = enumPossibleKernels()
            kernels = 'deLaValleePoussinKernel';
        end
    end
end

