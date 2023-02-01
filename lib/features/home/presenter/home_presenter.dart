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
  int selectedIndexPage = 0;
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar.logo(),
      bottomNavigationBar: CustomNavigationBar(controller: controller, notifications: 10),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            InitScreen(),
            Center(child: Text('Fidelidade')),
            Center(child: Text('Notificacoes')),
            Center(child: Text('Mais'))
          ],
        ),
      )
    );
  }
}