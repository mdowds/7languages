-module(count).
-export([word/1]).
-export([word_r/1]).
-export([to_ten/1]).

word(Word) -> length(string:split(Word, " ", all)).

word_r(Word) -> count_items(string:split(Word, " ", all)).

count_items([]) -> 0;
count_items([_ | Tail]) -> 1 + count_items(Tail).

to_ten(0) -> io:fwrite("~w\n", [0]), to_ten(1);
to_ten(10) -> io:fwrite("~w\n", [10]);
to_ten(X) -> io:fwrite("~w\n", [X]), to_ten(X+1). 
