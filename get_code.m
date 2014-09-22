function code = get_code(provider,dataset_code,code_id,print_on)

if nargin < 4
    print_on = 1;
end

addpath /home/michel/tools/matlab-json
g = urlread(['http://localhost:8000/' provider '/dataset/' dataset_code]);
%g = urlread(['http://ceres.cepremap.org/' provider '/datasets']);
g1 = fromjson(g);
code = g1{1}.codesList.(upper(code_id));
if print_on
    for i = 1:length(code)
        disp(sprintf('%-50s %s',char(code{i}(2)),char(code{i}(1))))
    end
end
