function [series,g] = get_dataset(provider,dataset_code,varargin)

request = ['/datasets/' lower(provider) '-' lower(dataset_code) '/values'];

if nargin > 2
    request = [request '?'];
    i = 1;
    while i <= nargin - 2
        if i > 1
            request = [request '&'];
        end
        request = [request lower(varargin{i}) '='];
        i = i + 1;
        for j=1:length(varargin{i})
            if j > 1
                request = [request '+'];
            end
            request = [request varargin{i}{j}]
        end
        i = i + 1;
    end
end
        
try
    g = widukind_json_request(request);
catch ME
    rethrow(ME)
end

series = {};
for i=1:length(g.data)
    d = g.data{i};
    s.key = d.key;
    s.values = NaN(length(d.values),1);
    for j=1:length(d.values)
        v = str2num(d.values{j}.value);
        if ~isempty(v)
            s.values(j) = v;
        end
    end
    s.name = d.name;
    s.start_date = ordinal2date(double(d.start_date),d.frequency);
    s.frequency = d.frequency;
    series{i} = s;
end
