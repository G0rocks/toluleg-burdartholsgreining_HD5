classdef skifuelement
    %skifuelement Klassi fyrir skifuelement thar sem haegt er ad setja inn
    %eiginleika og leysa fyrir faerslur.
    
    properties
        Property1
    end
    
    methods
        function obj = untitled2(inputArg1,inputArg2)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end
