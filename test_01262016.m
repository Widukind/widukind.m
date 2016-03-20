s = get_series_by_key('IMF','WEO', 'NGDP_R.MYS.1');

n = length(s.values);
sd = s.start_date;
t0 = sd.year + sd.sub/sd.freq;
t1 = t0 + n/sd.freq;
time=linspace(t0,t1,n);

figure;
plot(time,s.values);title(s.name)