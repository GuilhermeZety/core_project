import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:core_project/core/common/extensions/color_extension.dart';
import 'package:core_project/ui/components/buttons.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: AppColors.yellow_500.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Button(onPressed: () {}, style: ButtonStyle(backgroundColor: Colors.transparent.toMaterialStateProperty()), child: Text('Selecionar Categoria', style: TextStyle(fontWeight: FontWeight.bold)),).expanded(),
          Button(onPressed: () {}, style: ButtonStyle(backgroundColor: Colors.transparent.toMaterialStateProperty()), child: Text('Balneario pa', style: TextStyle(fontWeight: FontWeight.bold),)).expanded(),
        ],
      ),
    );
  }
}