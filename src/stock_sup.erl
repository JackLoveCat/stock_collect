-module(stock_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% worker | supervisor
%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    init_base(),
    {ok, {
       {one_for_one, 5, 10}, 
       [
        ?CHILD(reptitl_service,worker),
        ?CHILD(cron_service,worker)
       ]
      }
    }.

init_base()->
    inet:start().
