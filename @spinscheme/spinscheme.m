classdef spinscheme
    %SPINSCHEME   Class for representing timestepping schemes.
    
    % Copyright 2016 by The University of Oxford and The Chebfun Developers.
    % See http://www.chebfun.org/ for Chebfun information.
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CLASS PROPERTIES:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties ( Access = public )
        
        internalStages  % number of internal stages
        order           % order of the method
        scheme          % Timestepping scheme
        steps           % number of previous timesteps used (1 if one-step
        % method, > 1 if multistep method)
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CLASS CONSTRUCTOR:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods ( Access = public, Static = false )
        
        function K = spinscheme(schemeName)
            
            if ( nargin == 0 )
                return
            end
            
            switch schemeName
                
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % ETD MULTISTEP:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'abnorsett4'
                    K.order = 4;
                    K.internalStages = 1;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case'abnorsett5'
                    K.order = 5;
                    K.internalStages = 1;
                    K.steps = 5;
                    K.scheme = schemeName;
                    
                case 'abnorsett6'
                    K.order = 6;
                    K.internalStages = 1;
                    K.steps = 6;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % ETD RUNGE-KUTTA:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'etdrk4'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'exprk5s8'
                    K.order = 5;
                    K.internalStages = 8;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'friedli'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'hochbruck-ostermann'
                    K.order = 4;
                    K.internalStages = 5;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'krogstad'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'minchev'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'strehmel-weiner'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % LAWSON:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'ablawson4'
                    K.order = 4;
                    K.internalStages = 1;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case 'lawson4'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    % GENERALIZED LAWSON:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'genlawson41'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'genlawson42'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 2;
                    K.scheme = schemeName;
                    
                case 'genlawson43'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 3;
                    K.scheme = schemeName;
                    
                case 'genlawson44'
                    K.order = 5;
                    K.internalStages = 4;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case 'genlawson45'
                    K.order = 6;
                    K.internalStages = 4;
                    K.steps = 5;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % MODIFIED GENERALIZED LAWSON:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'modgenlawson41'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 1;
                    K.scheme = schemeName;
                    
                case 'modgenlawson42'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 2;
                    K.scheme = schemeName;
                    
                case 'modgenlawson43'
                    K.order = 4;
                    K.internalStages = 4;
                    K.steps = 3;
                    K.scheme = schemeName;
                    
                case 'modgenlawson44'
                    K.order = 5;
                    K.internalStages = 4;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case 'modgenlawson45'
                    K.order = 6;
                    K.internalStages = 4;
                    K.steps = 5;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % PREDICTOR-CORRECTOR:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case {'pec423', 'pece423'}
                    K.order = 4;
                    K.internalStages = 2;
                    K.steps = 3;
                    K.scheme = schemeName;
                    
                case {'pecec433', 'pecece433'}
                    K.order = 4;
                    K.internalStages = 3;
                    K.steps = 3;
                    K.scheme = schemeName;
                    
                case {'pec524', 'pece524'}
                    K.order = 5;
                    K.internalStages = 2;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case {'pecec534', 'pecece534'}
                    K.order = 5;
                    K.internalStages = 3;
                    K.steps = 4;
                    K.scheme = schemeName;
                    
                case {'pec625', 'pece625'}
                    K.order = 6;
                    K.internalStages = 2;
                    K.steps = 5;
                    K.scheme = schemeName;
                    
                case {'pecec635', 'pecece635'}
                    K.order = 6;
                    K.internalStages = 3;
                    K.steps = 5;
                    K.scheme = schemeName;
                    
                case {'pec726', 'pece726'}
                    K.order = 7;
                    K.internalStages = 2;
                    K.steps = 6;
                    K.scheme = schemeName;
                    
                case {'pecec736', 'pecece736'}
                    K.order = 7;
                    K.internalStages = 3;
                    K.steps = 6;
                    K.scheme = schemeName;
                    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % MISC:
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                case 'eglm433'
                    K.order = 4;
                    K.internalStages = 3;
                    K.steps = 3;
                    K.scheme = schemeName;
                    
                otherwise
                    error('SPINSCHEME:constructor', 'Unrecognized scheme.')
            end
            
        end
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CONCRETE AND STATIC METHODS:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods ( Access = public, Abstract = false, Static = true )
        
        %  Evaluate a phi-function:
        phi = phiEval(l, LR, N, dim, nVars)
        
        % Get a function handle to a phi-function:
        phi = phiFun(l)
        
        % Evaluate a psi-function:
        psi = psiEval(l, C, LR, N, dim, nVars)
        
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CONCRETE AND NON-STATIC METHODS:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    methods ( Access = public, Abstract = false, Static = false )
        
        % Compute coefficients of a SPINSCHEME:
        schemeCoeffs = computeCoeffs(K, dt, L, M, S)
        
        % Do one step of a SPINSCHEME:
        [uSol, NuSol] = oneStep(K, schemeCoeffs, Nc, Nv, nVars, uSol, NuSol)
        
        % Get enough initial data when using a multistep SPINSCHEME:
        [uSol, NuSol, dt] = startMultistep(K, adaptiveTime, dt, L, Nc, Nv, ...
            pref, S, uSol, NuSol);
        
    end
    
end