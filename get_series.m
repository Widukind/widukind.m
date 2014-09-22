function g=get_series(provider,dataset_code,varargin)

query = ['http://localhost:8000/eurostat/dataset/' dataset_code '/' ...
                    'values'];
if length(varargin)
    query = [query '?'];
end

for i = 1:2:length(varargin)
    if i > 1
        query = [query '&']
    end
    query = [query upper(varargin{i}) '=' upper(varargin{i+1})];
end
         
disp(query)

g = fromjson(urlread(query))