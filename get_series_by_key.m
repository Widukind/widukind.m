function s = get_series_by_key(provider,dataset_code,key)

g = fromjson(urlread(['http://localhost:8000/' provider '/dataset/' dataset_code '/series/' ...
                    key]));

s.key = key;
s.values = str2num(char(g{1}.values));
s.startDate = g{1}.endDate;
s.freq = g{1}.dimensions.FREQ;