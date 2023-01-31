import 'package:core_project/core/common/translated.dart';
import 'package:core_project/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Core'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Translated()!.salve),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => settingsLogic.changeThemeMode(ThemeMode.light), 
                    child: Text('Change Theme To Light')
                  ),
                  TextButton(onPressed: () {
                    settingsLogic.changeThemeMode(ThemeMode.dark);

                  }, child: Text('Change Theme To dark')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async {
                    await settingsLogic.changeLocale(context, Locale('en'));

                  }, child: Text('Change Locale To EN')),
                  TextButton(onPressed: () {
                    settingsLogic.changeLocale(context, Locale('pt'));

                  }, child: Text('Change Locale To PT')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}