-module(message).
-export([log/1]).

log(success) -> "Success";
log({error, Message}) -> string:concat("error: ", Message).
