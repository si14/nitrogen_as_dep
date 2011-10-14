%% -*- mode: nitrogen -*-
-module (my_page).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Hello from my_page.erl!".

body() ->
    wf:comet(fun() -> counter(1) end),
    #panel { id=placeholder }.

counter(Count) ->
    timer:sleep(1000),
    wf:update(placeholder, testapp:test() ++ " " ++ integer_to_list(Count)),
    wf:flush(),
    counter(Count + 1).

event(click) ->
    wf:insert_top(placeholder, "<p>You clicked the button!").
