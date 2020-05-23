%%%-------------------------------------------------------------------
%%% @author Efrén Fuentes <efrenfuentes@gmail.com>
%%% @copyright (C) 2020, Efrén Fuentes
%%% @doc
%%% Handler for Antenna websocket connections.
%%% 
%%% @end
%%% Created : 22 May 2020 by some name <efrenfuentes@gmail.com>
%%%-------------------------------------------------------------------
-module(antenna_handler).
-behavior(cowboy_websocket).


-export([
  init/2,
  websocket_init/1,
  websocket_handle/2,
  websocket_info/2,
  terminate/3
]).


init(Request, State) ->
  {cowboy_websocket, Request, State}.


websocket_init(State) ->
  {ok, State}.


websocket_handle({ping, _Message}, State) ->
  {reply, {text, <<"pong">>}, State};

websocket_handle({text, Message}, State) ->
  try jiffy:decode(Message, [return_maps]) of
    Json ->
      websocket_handle({json, Json}, State)
  catch
    _:_ ->
      {reply, {text, <<"Invalid message received:\n", Message/binary>>}, State}
  end;

websocket_handle({json, Message}, State) ->
  try maps:get(<<"action">>, Message) of
    Action ->
      case Action of
        <<"create_room">> ->
          {reply, {text, <<"You want create a room">>}, State};
        <<"join_room">> ->
          {reply, {text, <<"You want join to room">>}, State};
        _ ->
          {reply, {text, <<"{\"error\": \"unknown action '", Action/binary, "'\"}">>}, State}
      end
  catch
    _:_ ->
      {reply, {text, <<"{\"error\": \"no action\"}">>}, State}
  end.
  

websocket_info(Message, State) ->
  {reply, {text, Message}, State}.


terminate(_Reason, _Request, _State) ->
  ok.
