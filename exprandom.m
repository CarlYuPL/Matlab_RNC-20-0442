function [dwt]=exprandom(lambda)
a=rand(1,1);
dwt=-1/lambda*log(1-a);
end