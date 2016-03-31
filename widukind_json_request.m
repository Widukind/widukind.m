function g = widukind_json_request(request)

if ~exist('fromjson')
    p = fileparts(mfilename('fullpath'));
    matlab_json_path = fullfile(p,'bin');
    addpath(matlab_json_path)
end

g = NaN;

fullrequest = ['http://widukind-api.cepremap.org/api/v1/json' request];

[reply, status] = urlread(fullrequest);

g = fromjson(reply);

if isfield(g,'error') || status == 0
    ME = MException('widukind:notFound','%s couldn''t be found', ...
                    fullrequest);
    throw(ME)
end


