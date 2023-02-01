import 'package:core_project/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Panel extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final bool withShadow;
  final bool secondary;
  final bool isLoading;
  final Size? size;

  const Panel.primary({
    super.key, 
    this.padding = const EdgeInsets.all(10), 
    this.child,
    this.withShadow = true,
    this.secondary = false, 
    this.isLoading = false, 
    this.size,
  });

  const Panel.secondary({
    super.key, 
    this.padding = const EdgeInsets.all(10), 
    this.child,
    this.withShadow = false,
    this.secondary = true,
    this.isLoading = false, 
    this.size,
  });
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if(isLoading) {
      return Shimmer.fromColors(
        baseColor: AppColors.grey_100,
        highlightColor: AppColors.grey_50,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          width: size?.width ?? double.infinity,
          height: size?.height ?? double.infinity,
        ),
      );
    }
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        // height: size?.height ?? double.infinity,
        decoration: BoxDecoration(
          color: !secondary ? colorScheme.primaryContainer : colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: withShadow ? [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary,
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ] : [],
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}