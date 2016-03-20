# Widukind for Matlab

This package downloads Widukind series directly in Matlab or Octave

# Installation

After downloading, you need to add this package to your Matlab or Octave path

# Dependency

The package uses the JSON parser from https://github.com/christianpanton/matlab-json.git as a MEX file.

We add the MEX files for Windows in ./bin. If you use Linux or OS/X, you need to download the matlab-json package from the above URL, compile it and install it in ./bin

# Functionalities

This package provides the following 

- retrieving a series by key: `s = get_series_by_key(provider,dataset_code,key)`. The series is returned in a Matlab structure:
  - s.name: (string) series name
  - s.key: (string) series key
  - s.dimension: (structure) dimensions of the series
  - s.start_date: (structure) starting date
    - s.start_date.year: year
    - s.start_date.sub: number of subperiod ('A' 0, 'Q' 0:3, 'M' 0:11)
    - s.start_date.freq: infra-annual frequency ('A': 1, 'Q': 4, 'M' 12)
  - s.values: ([double]) values

Currently, the package supports only annual, quarterly and monthly data.

# Example

test_01262016.m plots the gross domestic product at constant prices for Malaysia  (annual percent change) retrieved from IMF WEO



