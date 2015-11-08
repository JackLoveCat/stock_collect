%%%-------------------------------------------------------------------
%%% @author Jack <yebin.xm@gmail.com>
%%% @copyright (C) 2015, Jack
%%% @doc
%%% http请求网络模块
%%% @end
%%% Created :  5 Nov 2015 by Jack <yebin.xm@gmail.com>
%%%-------------------------------------------------------------------
-module(lib_http).

%% API
-export([request_body/1
        ]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc 请求并返回请求结果
%% @spec
%% @end
%%--------------------------------------------------------------------
request_body(Url)->
    case httpc:request(Url) of
        {ok,Result} ->
            paras_protocal(Result);
        {error, Reason} ->
            Reason
    end.
%%%===================================================================
%%% Internal functions
%%%===================================================================
paras_protocal({ok,{Protocal,Head,Content}}) ->
    io:format("protocal : ~p~n" ,[Protocal]),
    lists:foreach(fun({Name,Value})-> 
                          io:format("~p : ~p ~n",[Name,Value])
                  end
                 , Head),
    Content.
