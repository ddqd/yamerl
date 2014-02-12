-module(apply_option_tests).

-include_lib("eunit/include/eunit.hrl").

-define(NODE_OPTION, [{erlang_atom_autodetection, true}]).

pre_start_test_() ->
    fun() ->
        Res = application:start(yamerl),
        ?assertEqual(Res, ok)
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