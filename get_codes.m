function code_list = get_codes(provider,dataset_code,print_on)

if nargin < 3
    print_on = 1;
end

addpath /home/michel/tools/matlab-json
g = urlread(['http://localhost:8000/' provider '/dataset/' dataset_code]);
%g = urlread(['http://ceres.cepremap.org/' provider '/datasets']);
g1 = fromjson(g);
code_list = fieldnames(g1{1}.codesList);
if print_on
    disp(code_list)
end
