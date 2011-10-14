-module(testapp).

-behaviour(application).

-export([start/0, stop/0, test/0]).
%% Application callbacks
-export([start/2, stop/1]).

start() ->
    application:start(nitrogen),
    application:start(testapp).

stop() ->
    application:stop(testapp).

test() ->
    "test_foobar".

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    testapp_sup:start_link().

stop(_State) ->
    ok.
