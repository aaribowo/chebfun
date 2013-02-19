function f = restrict(f, s, pref)
%RESTRICT Restrict a FUNCHEB1 to a subinterval.
%   RESCTRICT(F, S) returns a FUNCHEB1 that is restricted to the subinterval
%   [S(1),S(2)] of [-1, 1]. Note that that since FUNCHEB1 only live on [-1,1], a
%   linear change of variables is applied.
%
%   If length(S)>2, i.e., S = [S(1), S(2), S(3), ...], then RESCTRICT(F, S)
%   returns a multivalued FUNCHEB1 where each column of F is restricted to each
%   of the subintervals defined by S.

% Copyright 2013 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

% Check if subint is actually a subinterval
if ( s(1) < -1 || s(end) > 1 || any(diff(s) <= 0) )
    error('FUNCHEB1:restrict:badinterval', 'Not a valid interval.')
elseif ( numel(s) == 2 && all(s == [-1, 1]) )
    % Nothing to do here!
    return
end

% Compute new values and coeffs:
n = length(f);
x = funcheb1.chebpts(n);                     % old grid
y = .5*[1-x, 1+x] * [s(1:end-1) ; s(2:end)]; % new grid
values = feval(f, y);                        % new values
coeffs = funcheb1.chebpoly(values);          % new coeffs

% Append data to fun:
f.values = values;
f.coeffs = coeffs;

% Grab a tolerance:
if ( nargin < 3 )
    pref = funcheb1.pref; 
end
pref.funcheb1.eps = max(pref.funcheb1.eps, f.epslevel);

% Simplify the output fun:
f = simplify(f, pref);

end
