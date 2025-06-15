import 'package:flutter/material.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/presentation/resources/values/dimension.dart';
import 'package:flutter_project_starter/presentation/resources/values/typography.dart';
import 'package:flutter_project_starter/presentation/resources/widget/network_image_view.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/routes.dart';

class GameItemView extends StatelessWidget {
  final GameModel gameModel;
  const GameItemView({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return GestureDetector(
      onTap: (){
        context.push(gameDetailPath,extra: gameModel);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusS),
          border: Border.all(color: Colors.black)
        ),
        padding: EdgeInsets.all(spacing4),
        margin: EdgeInsets.symmetric(vertical: spacing4),
        child: Row(
          children: [
            NetworkImageView(url: gameModel.backgroundImage,width: 100,height: 100,fit: BoxFit.cover,),
            SizedBox(width: spacing4,),
            Text(gameModel.name,style: smallRegular,)
          ],
        ),
      ),
    );
  }


}
