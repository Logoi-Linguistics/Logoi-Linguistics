:- module(prelog, 	[parse_sentence/2,
			 parse_sentence/3,
			 parse_sentence/4,
			 parse_sentence/5,
			 parse_sentence/6,
			 prelog/2,
			 to_prolog/2,
			 dispatch/3]).

:- set_prolog_flag(double_quotes, chars).

:- use_module(library(lists)).

%
% prelog/2 takes a list of strings and returns a list of strings.
%   The first list is assumed English, the second is Prolog.
%

append_to_file(Filename, String) :-
	open(Filename, append, File),
	writeln(File, String),
	close(File).

is_newline(String) :-
	member(String, ['n', "n", "\n"]).

prelog([], []).

prelog([Line | Rest], [Result | Results]) :-
	prelog(Line, Result),
	prelog(Rest, Results).

prelog(String, Result) :-
	is_newline(String),
	% append_to_file("/var/www/html/api/db.pl", String),
	Result = "<br />".

prelog(String, Result) :-
	% append_to_file("/var/www/html/api/db.pl", String),
	% strip(String, Stripped),
	apply_rules(String, List),
	to_prolog(List, Prolog),
	append_to_file("/var/www/html/api/db.pl", Prolog),
	Result = Prolog.
	% atomics_to_string(List, Line),
	% Result = Line.

strip(String, Stripped) :-
	string_length(String, L),
	L > 0,
	sub_string(String, 1, _, 0, Stripped).
	
strip(String, Stripped) :-
	string_length(String, L),
	L < 1,
	Stripped = "".

%%%
%%% DCG Wrappers
%%%

apply_rules(String, Results) :-
	arity2_wrapper(String, Results), !;
	arity3_wrapper(String, Results), !;
	arity4_wrapper(String, Results), !;
	arity5_wrapper(String, Results), !;
	arity6_wrapper(String, Results).

%
% For the prioritized list of rules
%

arity6_wrapper(String, Results) :-
	parse_sentence(String, A, B, C, D, E),
	Results = [A, B, C, D, E].

parse_sentence(Sentence, First, Second, Third, Fourth, Fifth) :-
	atom_string(AtomSentence, Sentence),
	atom_chars(AtomSentence, Chars),
	phrase(sentence(First, Second, Third, Fourth, Fifth), Chars), !.

%
% For universal facts about the environment
%

arity5_wrapper(String, Results) :-
	parse_sentence(String, A, B, C, D),
	Results = [A, B, C, D].

parse_sentence(Sentence, First, Second, Third, Fourth) :-
	atom_string(AtomSentence, Sentence),
	atom_chars(AtomSentence, Chars),
	phrase(sentence(First, Second, Third, Fourth), Chars), !.

%
% For the first (Dialect:) line and group relationships
%

arity4_wrapper(String, Results) :-
	parse_sentence(String, A, B, C),
	Results = [A, B, C].

parse_sentence(Sentence, First, Second, Third) :-
	atom_string(AtomSentence, Sentence),
	atom_chars(AtomSentence, Chars),
	phrase(sentence(First, Second, Third), Chars), !.

%
% For individual facts (attributes)
%

arity3_wrapper(String, Results) :-
	parse_sentence(String, A, B),
	Results = [A, B].

parse_sentence(Sentence, First, Second) :-
	atom_string(AtomSentence, Sentence),
	atom_chars(AtomSentence, Chars),
	phrase(sentence(First, Second), Chars), !.

%
% For section headers (Facts: + Rules:)
%

arity2_wrapper(String, Results) :-
	parse_sentence(String, A),
	Results = [A].

parse_sentence(Sentence, First) :-
	atom_string(AtomSentence, Sentence),
	atom_chars(AtomSentence, Chars),
	phrase(sentence(First), Chars), !.

%%%
%%% DCG Patterns
%%%

% 'Rules:' / 'Facts:' starting lines
sentence(Section) -->
	"n",
	word(Section),
	":".

% Blank newline
sentence(Character) -->
	single_char(Character).

% Predicates
sentence(Individual, Attribute) -->
	"n- (",
	word(Individual),
	") is (",
	word(Attribute),
	").".

% Dialect line
sentence(Dialect, Language, Comment) -->
	any_chars,
	"Dialect: ",
	word(Dialect),
	" ",
	word(Language),
	".",
	rest_of_line(Comment).

% Two-person relationships
sentence(PersonA, PersonB, Relationship) -->
	"n- (",
	word(PersonA),
	") and (",
	word(PersonB),
	") are (",
	word(Relationship),
	").".

% Universal Fact
sentence(Subject, Verb, Amount, Object) -->
	"n- ",
	word(Subject),
	space,
	word(Verb),
	" (",
	natural_number(Amount),
	") ",
	word(Object),
	".".

% Three-person relationships
sentence(PersonA, PersonB, PersonC, Relationship) -->
	"n- (",
	word(PersonA),
	"), (",
	word(PersonB),
	"), and (",
	word(PersonC),
	") are (",
	word(Relationship),
	").".

% Rule
sentence(Priority, Who, Constraint, Action, Location) -->
	"n",
	natural_number(Priority),
	": (",
	word(Who),
	") (",
	word(Constraint),
	") ",
	word(Action),
	" (",
	word(Location),
	").".

% Catch-all general pattern
sentence(unknown, unknown, unknown, unknown, unknown) --> any_chars.

%%%
%%% DCG Helpers
%%%

natural_number(N) --> digits(Cs), { number_codes(N, Cs) }.
digits([D|Ds]) --> digit(D), digits(Ds).
digits([D]) --> digit(D).
digit(D) --> [D], { char_type(D, digit) }.

word(Word) --> chars(Chars), { atom_codes(Word, Chars) }.
chars([C|Cs]) --> [C], { \+ member(C, [':', '(', ')', '.']) }, chars(Cs).
chars([]) --> [].

single_char(Char) --> [C], { \+ member(C, ['(', ')']), Char = C }.

space --> " ", !.

letter_n --> ["n"].

any_chars --> [].
any_chars --> [_], any_chars.

rest_of_line(Line) -->
	rest_of_line_helper(LineChars),
	{ atom_chars(Line, LineChars) }.

rest_of_line_helper([]) --> [].
rest_of_line_helper([C|Cs]) --> [C], rest_of_line_helper(Cs).

blank_line --> whitespaces, end_of_line.

whitespaces --> [].
whitespaces --> whitespace, whitespaces.
whitespace --> [' ']; ['\t'].

end_of_line --> ['\n']; [].

%%%
%%% Prolog Writer
%%%

to_prolog(EnglishTokens, Prolog) :-
	length(EnglishTokens, Length),
	dispatch(EnglishTokens, Length, Result),
	% append_to_file("/var/www/html/api/db.pl", Result),
	Prolog = Result.
	% Prolog = "Fail.".

% Newline
dispatch(List, Length, Prolog) :-
	member(Length, [1]),
	nth1(1, List, Character),
	string_length(Character, 1),
	atomics_to_string(['<', 'b', 'r', ' ', '/', '>'], Newline),
	Prolog = Newline, !.
	
% Section headers
dispatch(List, Length, Prolog) :-
	member(Length, [1]),
	nth1(1, List, Section),
	atomics_to_string(['%', ' '], Comment),
	string_concat(Comment, Section, Prolog), !.

% Individual attributes
dispatch(List, Length, Prolog) :-
	Length = 2,
	nth1(1, List, Individual),
	nth1(2, List, Attribute),
	
	% attribute(
	string_lower(Attribute, Lowercase),
	atomic_list_concat([Lowercase, '('], Functor),
	
	% 'Individual'
	atomic_list_concat(['\'', Individual, '\''], Term),
	
	% attribute('Individual').
	atomic_list_concat([Functor, Term, ')', '.'], Result),
	atomics_to_string(Result, Prolog), !.

% Dialect line
dispatch(List, Length, Prolog) :-
	Length = 3,
	nth1(1, List, 'Wedding'),
	nth1(2, List, 'English'),
	nth1(3, List, Comments),
	atomic_list_concat(['%', ' ', Comments], Prolog), !.

% Two-person relationships
dispatch(List, Length, Prolog) :-
	Length = 3,
	nth1(1, List, PersonA),
	nth1(2, List, PersonB),
	nth1(3, List, Relationship),
	
	% relationship(
	string_lower(Relationship, Lowercase),
	atomic_list_concat([Lowercase, '('], Functor),
	
	% personA
	string_lower(PersonA, A),
	
	% personB
	string_lower(PersonB, B),
	
	% relationship('PersonA', 'PersonB').
	atomic_list_concat([Functor, A, ',', ' ', B, ')', '.'], Prolog), !.
	
% Universal facts about the environment
dispatch(List, Length, Prolog) :-
	Length = 4,
	nth1(1, List, _Subject),
	nth1(2, List, _Verb),
	nth1(3, List, N),
	nth1(4, List, Item),

	number(N),
	
	% item(
	string_lower(Item, Lowercase),
	atomic_list_concat([Lowercase, '('], Functor),
	
	% item(Number).
	number_string(N, NString),
	atomic_list_concat([Functor, NString, ')', '.'], Prolog), !.

% Three-person group relationships
dispatch(List, Length, Prolog) :-
	Length = 4,
	nth1(1, List, PersonA),
	nth1(2, List, PersonB),
	nth1(3, List, PersonC),
	nth1(4, List, Relationship),

	string_lower(PersonA, LowerA),
	string_lower(PersonB, LowerB),
	string_lower(PersonC, LowerC),
	string_lower(Relationship, Lowercase),
	
	atomic_list_concat([Lowercase, '(', LowerA, ',', ' ', LowerB, ',', ' ', LowerC, ')', '.'], Prolog), !.

% Rules
dispatch(List, Length, Prolog) :-
	Length = 5,
	nth1(1, List, _Priority),
	nth1(2, List, Who),
	nth1(3, List, _Constraint),
	nth1(4, List, _Verb),
	nth1(5, List, Where),
	
	% 'where'(
	string_lower(Where, Lowercase),
	string_lower(Who, Conditional),
	% affix_prefix(Conditional, Constraint, Prefixed),
	
	atomic_list_concat([Lowercase, '(', 'p', 'e', 'r', 's', 'o', 'n', 'A', ',', ' ', 'p', 'e', 'r', 's', 'o', 'n', 'B', ')', ' ', ':', '-', ' ', Conditional], Prolog), !.

needle_haystack(Needle, Haystack) :-
	sub_string(Haystack, _, _, _, Needle).

affix_prefix(Clause, Constraint, Result) :-
	needle_haystack("not", Constraint),
	atomic_list_concat(['\\', '+', ' '], Negation),
	string_concat(Negation, Clause, Result).

affix_prefix(Clause, _Constraint, Result) :-
	Result = Clause.

constraint_concat(Left, Constraint, Identifier, Result) :-
	member("not", Constraint),
	atomic_list_concat([Left, '\\', '+', ' '], Predicate),
	string_lower(Identifier, Lowercase),
	atomic_list_concat([Predicate, Lowercase, "(PersonA, PersonB)."], Result).

constraint_concat(Left, _Constraint, Identifier, Result) :-
	string_lower(Identifier, Lowercase),
	atomic_list_concat([Left, Lowercase, "(PersonA, PersonB)."], Result).
