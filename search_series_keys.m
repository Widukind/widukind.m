function res=search_series_keys(provider,dataset_code,varargin)

query = ['http://localhost:8000/eurostat/dataset/' dataset_code '/' ...
                    'values'];
if length(varargin)
    query = [query '?'];
end

for i = 1:2:length(varargin)
    if i > 1
        query = [query '&'];
    end
    query = [query upper(varargin{i}) '=' upper(varargin{i+1})];
end
         
disp(query)

g = fromjson(urlread(query));

res = {};
for i = 1:length(g)
    res{i,1} = g{i}.name;
    res{i,2} = g{i}.key;
    disp(sprintf('%-50s %s',char(res{i,2}),char(res{i,1})))
end
