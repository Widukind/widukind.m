function d = ordinal2date(ordinal,freq)

d.year = NaN;
d.sub = NaN;
d.freq = NaN;

switch(freq)
  case 'A'
    d.year = ordinal + 1970;
    d.sub = 0;
    d.freq = 1;
  case 'Q'
    d.freq = 4;
    y = floor(ordinal/d.freq); 
    d.year = y + 1970;
    d.sub = ordinal - d.freq*y;
  case 'M'
    d.freq = 12;
    y = floor(ordinal/d.freq); 
    d.year = y + 1970;
    d.sub = ordinal - d.freq*y;
  otherwise
    disp(['frequency ' freq ' isn''t supported'])
end