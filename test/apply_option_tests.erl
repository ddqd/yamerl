-module(apply_option_tests).

-include_lib("eunit/include/eunit.hrl").

-define(NODE_OPTION, [{erlang_atom_autodetection, true}]).

pre_start_test_() ->
    fun() ->
        Res = application:start(yamerl),
        ?assertEqual(Res, ok),
        Set = yamerl_app:set_param(node_mods, [yamerl_node_erlang_atom]),
        ?assertEqual(Set, ok)
    end.

yamler_constr_apply_option_test_() ->
    fun () ->
        Atom1 = yamerl:decode("atom", ?NODE_OPTION),
        Atom2 = yamerl:decode("atom", ?NODE_OPTION),
        ?assertEqual(Atom2, Atom1)
    end.