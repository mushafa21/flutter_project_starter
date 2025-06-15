import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_starter/presentation/views/game/widget/game_item_view.dart';

import '../../../domain/models/game_model.dart';
import 'cubit/game_cubit.dart';

class FavoritedGameScreen extends StatelessWidget {
  const FavoritedGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorited Games"),),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildGameListView(context),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildGameListView(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      bloc: context.read<GameCubit>(),
      buildWhen: (prev, current) =>
      current is GameStateFavoritedLoading || current is GameStateFavoritedData ||
          current is GameStateFavoritedError,
      builder: (context, state) {
        if (state is GameStateFavoritedLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GameStateFavoritedError) {
          return Text(state.message);
        } else if (state is GameStateFavoritedData) {
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