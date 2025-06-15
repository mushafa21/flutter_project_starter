import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_starter/app/service_locator.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/presentation/resources/values/dimension.dart';
import 'package:flutter_project_starter/presentation/views/game/cubit/game_cubit.dart';
import 'package:flutter_project_starter/presentation/views/game/widget/game_item_view.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GameCubit>().getGameList();
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game"),),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          if (notification.metrics.maxScrollExtent ==
              notification.metrics.pixels) {
            context.read<GameCubit>().getGameListNextPage();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () {
            return context.read<GameCubit>().getGameList();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildSearchBarView(context),
                  SizedBox(height: spacing4,),
                  _buildGameListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBarView(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: "Search Game"
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (text){
        context.read<GameCubit>().getGameList(search: text);
      },
    );
  }


  Widget _buildGameListView() {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (prev, current) =>
      current is GameStateListLoading || current is GameStateListData ||
          current is GameStateListError,
      builder: (context, state) {
        if (state is GameStateListLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GameStateListError) {
          return Text(state.message);
        } else if (state is GameStateListData) {
          final List<GameModel> gameList = state.gameList;
          return ListView.builder(itemBuilder: (context, index) {
            return GameItemView(gameModel: gameList[index]);
          }, shrinkWrap: true, itemCount: gameList.length,physics: NeverScrollableScrollPhysics(),);
        }

        return Container();
      },
    );
  }
}
