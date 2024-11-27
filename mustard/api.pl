:- set_prolog_flag(double_quotes, chars).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).

:- use_module('prelog.pl').

server(Port) :-
	http_server(http_dispatch, [port(Port)]).

:- http_handler(/, api, []).

api(Request) :-
	% Confirm POST method
	member(method(post), Request), !,
	
	% Get request data
	http_read_data(Request, Data, []),

	% Remove leading JSON notation: `{"body":"`
	sub_string(Data, 9, _, 0, Body),

	% Remove trailing JSON notation: `"}`
	sub_string(Body, 0, _, 2, Prelog),

	% append_to_file("/var/www/html/api/db.pl", Prelog),

	% Split string on (repeating) newlines
	split_string(Prelog, "\\", "\\", Lines),

	% Convert English to Prolog
	prelog(Lines, Parsed),

	% Stitch list of strings into single string
	atomics_to_string(Parsed, Result),

	% write_to_file("/var/www/html/api/db.pl", Result),
	
	% Send response to client
	format('Content-Type: text/plain~n~n'),
	format('~s', [Result]).

:- initialization(server(8000)).

append_to_file(Filename, String) :-
	open(Filename, append, File),
	write(File, String),
	close(File).
