import 'package:flutter/material.dart';

import 'package:core_project/ui/components/inputs/text_input.dart';

import 'package:core_project/core/common/constants/app_assets.dart';

class CustomAppBar extends StatefulWidget  implements PreferredSizeWidget{
  const CustomAppBar({
    super.key, 
    this.content, 
    this.isLogo = false, 
    this.back = false,
    this.backAction,
    this.sufix = true,
    this.sufixAction, 
    this.isSearch,
    this.actionSearch
  });

  const CustomAppBar.logo({
    super.key, 
    this.content, 
    this.isLogo = true, 
    this.back = false,
    this.backAction,
    this.sufix = true,
    this.sufixAction, 
    this.isSearch,
    this.actionSearch
  });

  const CustomAppBar.search({
    super.key, 
    this.content, 
    this.isLogo = false, 
    this.back = true,
    this.backAction,
    this.sufix = true,
    this.sufixAction, 
    this.isSearch, 
    this.actionSearch
  });
  
  final Widget? content;
  final bool isLogo;
  final bool back;
  final void Function()? backAction;
  final bool sufix;
  final void Function()? sufixAction;
  final bool? isSearch;
  final void Function(String value)? actionSearch;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: widget.back ? Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.inverseSurface, size: 25),
          onPressed: widget.backAction ?? () => Navigator.of(context).pop(),
        ),
      ) : null,
      actions: widget.sufix ? [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).colorScheme.inverseSurface, size: 30),
            onPressed: widget.sufixAction ?? () {},
          ),
        )
      ] : null,
      title: widget.isSearch == true ?
        TextInput(TextEditingController(), showError: false, size: Size(double.infinity, 40),) 
        :
        widget.isLogo ? 
          Image.asset(AppAssets.logo, height: 40, color: Theme.of(context).colorScheme.inverseSurface) 
          : 
          widget.content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
