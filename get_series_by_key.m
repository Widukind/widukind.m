function s = get_series_by_key(provider,dataset_code,key)

slug = [lower(provider) '-' lower(dataset_code) '-' ...
        lower(regexprep(key,'[_.&]','-'))];

[reply, status] = urlread(['http://widukind-api.cepremap.org/api/v1/json/series/' ...
                 slug]);

if status == 0
    disp([slug ' couldn''t be found'])
    s = NaN;
    return
end

g = fromjson(reply);

s.key = key;
s.values = NaN(length(g.data.values));
for i=1:length(g.data.values)
    v = str2num(g.data.values{i}.value);
    if ~isempty(v)
        s.values(i) = v;
    end
end
s.name = g.data.name;
s.dimensions = g.data.dimensions;
s.start_date = ordinal2date(double(g.data.start_date),g.data.frequency);

