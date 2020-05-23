%%%-------------------------------------------------------------------
%%% @author Efrén Fuentes <efrenfuentes@gmail.com>
%%% @copyright (C) 2020, Efrén Fuentes
%%% @doc
%%% Antenna Supervisor.
%%% 
%%% @end
%%% Created : 22 May 2020 by some name <efrenfuentes@gmail.com>
%%%-------------------------------------------------------------------
-module(antenna_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).


start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).


init([]) ->
	Procs = [],
	{ok, {{one_for_one, 1, 5}, Procs}}.
