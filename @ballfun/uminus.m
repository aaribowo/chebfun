function g = uminus(f)
%-   BALLFUN unary minus.
%   -F negates the BALLFUN F.
%
%   G = UMINUS(A) is called for the syntax '-A'.

% Copyright 2018 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

X = f.coeffs;
g = ballfun(-X);

end
