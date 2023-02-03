import 'package:core_project/core/common/extensions/responsive_extension.dart';
import 'package:core_project/core/common/extensions/theme_extension.dart';
import 'package:core_project/features/home/presenter/cubit/home_cubit.dart';
import 'package:core_project/features/init/presenter/init_screen.dart';
import 'package:core_project/ui/components/bars/custom_appbar.dart';
import 'package:core_project/ui/components/bars/custom_navigationbar.dart';
import 'package:flutter/material.dart';

class HomePresenter extends StatefulWidget{
  const HomePresenter({super.key});

  @override
  State<HomePresenter> createState() => _HomePresenterState();
  
}

class _HomePresenterState extends State<HomePresenter> with TickerProviderStateMixin{
  HomeCubit cubit = HomeCubit();
  late TabController controller;

  @override
  void initState() {
    super.initState();
    
    controller = TabController(
      length: 4,
      vsync: this,
    )..addListener(() {setState(() {});});

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.isDesktop) {
           return Scaffold(
            backgroundColor: context.colorScheme.background,
            body: Center(child: Text('Desktop'))
          );
        }
        if(constraints.isTablet) {
           return Scaffold(
            backgroundColor: context.colorScheme.background,
            body: Center(child: Text('Tablet'))
          );
        }
        return Scaffold(
          backgroundColor: context.colorScheme.background,
          appBar: CustomAppBar.logo(),
          bottomNavigationBar: CustomNavigationBar(controller: controller, notifications: 7),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: TabBarView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                cubit.isConsumer ? InitScreen() : Center(child: Text('Minha Página')),
                cubit.isConsumer ? Center(child: Text('Fidelidade')) : Center(child: Text('Adicionar')),
                Center(child: Text('Notificacoes')),
                Center(child: Text('Mais'))
              ],
            ),
          )
        );
      }
    );
  }
}