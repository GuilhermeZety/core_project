import 'package:core_project/features/init/presenter/init_screen.dart';
import 'package:core_project/ui/components/bars/custom_appbar.dart';
import 'package:core_project/ui/components/bars/custom_navigationbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
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
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InitScreen(),
          Container(color: Colors.grey.shade200,),
          Container(color: Colors.grey.shade100,),
          Container(color: Colors.white,),
        ],
      )
    );
  }
}