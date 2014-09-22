function [names,codes,gg] = get_databases(provider, print_on)

if nargin < 2
    print_on = 1;
end

addpath /home/michel/tools/matlab-json
g = urlread(['http://localhost:8000/' provider '/categories']);
%g = urlread(['http://ceres.cepremap.org/' provider '/categories']);
g1 = fromjson(g);
m = 1;
for i=1:length(g1)
    if isfield(g1{i},'categoryCode')
        gg{m} = g1{i};
        names{m} = g1{i}.name;
        codes{m} = g1{i}.categoryCode;
        if print_on
            disp(sprintf('%30s %s',char(names{m}),char(codes{m})))
        end
        m = m+1;
    end
end