%%%-------------------------------------------------------------------
%%% @author Efrén Fuentes <efrenfuentes@gmail.com>
%%% @copyright (C) 2020, Efrén Fuentes
%%% @doc
%%% Antenna configuration file.
%%% 
%%% @end
%%% Created : 22 May 2020 by some name <efrenfuentes@gmail.com>
%%%-------------------------------------------------------------------

-define(ANTENNA_PORT, list_to_integer(os:getenv("ANTENNA_PORT", "9000"))).