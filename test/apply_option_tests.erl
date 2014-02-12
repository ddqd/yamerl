-module(apply_option_tests).

-include_lib("eunit/include/eunit.hrl").

-define(NODE_OPTION, [{erlang_atom_autodetection, true}]).

pre_start_test_() ->
    fun() ->
        application:load(yamerl),
        Set = yamerl_app:set_param(node_mods, [yamerl_node_erlang_atom]),
        Res = application:start(yamerl),
        ?assertEqual(Res, ok)
        % dbg:tracer(),
        % dbg:tp(yamerl_node_erlang_atom, '_', '_', [])
        % ?assertEqual(Set, ok)
    end.

yamler_constr_apply_option_one_test_() ->
    fun () ->
        %erlang:l(yamerl_node_erlang_atom),%,:module_info(),
        Atom = yamerl:decode("atom", ?NODE_OPTION),
        ?assertEqual([atom], Atom)
    end.

yamler_constr_apply_option_two_test_() ->
    fun () ->
        Atom = yamerl:decode("atom", ?NODE_OPTION),
        ?assertEqual([atom], Atom)
    end.