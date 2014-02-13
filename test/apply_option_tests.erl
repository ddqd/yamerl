-module(apply_option_tests).

-include_lib("eunit/include/eunit.hrl").

-define(NODE_OPTION, [{erlang_atom_autodetection, true}]).

-define(START_STOP_APP, [yamerl]).

start_app_test_() ->
    fun() ->
        [application:start(A) || A <- ?START_STOP_APP]
    end.

yamler_constr_apply_option_one_test_() ->
    fun () ->
        Atom = yamerl:decode("atom", ?NODE_OPTION),
        ?assertEqual([atom], Atom)
    end.

yamler_constr_apply_option_two_test_() ->
    fun () ->
        Atom = yamerl:decode("atom", ?NODE_OPTION),
        ?assertEqual([atom], Atom)
    end.

yamerl_parse_time_test_() ->
    fun() ->
        Res = yamerl:decode("time: 23:59:59", ?NODE_OPTION),
        ?assertEqual(Res, [[{time, 86399}]])
    end.

yamerl_time_to_erlang_() ->
    fun() ->
        [Res|_T] = yamerl:decode("time: 23:59:59", ?NODE_OPTION),
        Time = proplists:get_value(time, Res),
        ErlTime = calendat:seconds_to_time(Time),
        ?assertEqual(ErlTime, {23,59,59})
    end.

stop_app_test_() ->
    fun() ->
        [application:stop(A) || A <- ?START_STOP_APP]
    end.