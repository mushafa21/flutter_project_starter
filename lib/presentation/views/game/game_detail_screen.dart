import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/presentation/resources/values/dimension.dart';
import 'package:flutter_project_starter/presentation/resources/widget/network_image_view.dart';
import 'package:flutter_project_starter/presentation/views/game/cubit/game_cubit.dart';

class GameDetailScreen extends StatelessWidget {
  final GameModel gameModel;
  const GameDetailScreen({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Game Detail"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(screenPadding),
          child: Column(
            children: [
              _buildImageView(),
              _buildFavoriteView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageView(){
    return NetworkImageView(url: gameModel.backgroundImage);
  }

  Widget _buildFavoriteView(BuildContext context){
    final cubit = context.read<GameCubit>();
    cubit.checkIfFavorited(gameModel.id);
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) => current is GameStateFavoritedStatus,
      builder: (context, state) {
        bool isFavorited = false;
        if (state is GameStateFavoritedStatus) {
          isFavorited = state.isFavorited;
        }
        return IconButton(
          icon: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: isFavorited ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (isFavorited) {
              cubit.removeFavorite(gameModel.id);
            } else {
              cubit.addFavorite(gameModel);
            }
            // After toggling, immediately re-check the status to update the UI
            cubit.checkIfFavorited(gameModel.id);
          },
        );
      },
    );
  }
}
