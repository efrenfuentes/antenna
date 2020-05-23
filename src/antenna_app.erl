%%%-------------------------------------------------------------------
%%% @author Efrén Fuentes <efrenfuentes@gmail.com>
%%% @copyright (C) 2020, Efrén Fuentes
%%% @doc
%%% Antenna Application.
%%% 
%%% @end
%%% Created : 22 May 2020 by some name <efrenfuentes@gmail.com>
%%%-------------------------------------------------------------------
-module(antenna_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

-include("config.hrl").
-include_lib("kernel/include/logger.hrl").

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
        {'_', [{"/ws", antenna_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(ws,
        [{port, ?ANTENNA_PORT}],
        #{env => #{dispatch => Dispatch}}
    ),
    ?LOG_NOTICE(#{event => "Antenna Server started", port => ?ANTENNA_PORT}),
	antenna_sup:start_link().


stop(_State) ->
	ok.
