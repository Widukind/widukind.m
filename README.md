# Widukind for Matlab

# Installation

First, you need to install `matlab-json` that you can obtain at https://github.com/christianpanton/matlab-json.git

Then, you need to include it as well as the current package in your Matlab path, for example with `addpath`

# Functionalities

This package provides the following 

- retrieving all datasets: `[names,codes,gg] = get_all_databases(provider, print_on)`

- retrieving datasets available on Widukind: `[names,codes,gg] = get_available_databases(provider, print_on)`
- retrieving code names for a given dataset: `code_list = get_codes(provider,dataset_code,print_on)`
- retrieving a code for a given dataset: `code = get_code(provider,dataset_code,code_id,print_on)`
- retrieving a series by key: `s = get_series_by_key(provider,dataset_code,key)`. The series is returned in a Matlab structure.
- retrieving all series matching a query: `g=get_series(provider,dataset_code,varargin)`. The series are returned in a Matlab structure array. The query is in the form of pair of code name and regular expression.
- retrieving series keys matching a query: `res=search_series_keys(provider,dataset_code,varargin)`. The result is an cell array of series names and series keys.
