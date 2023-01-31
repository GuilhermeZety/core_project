import 'package:core_project/core/common/translated.dart';
import 'package:core_project/ui/components/bars/custom_bottom_appbar.dart';
import 'package:core_project/ui/components/buttons.dart';
import 'package:core_project/ui/components/custom_checkbox.dart';
import 'package:core_project/ui/components/subscaffold.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';

import 'package:core_project/ui/components/panels.dart';
import 'package:gap/gap.dart';

import 'package:core_project/main.dart';
import 'package:sized_context/sized_context.dart';

import 'package:core_project/ui/components/dialogs/custom_dialogs.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubScaffold(
      bottom: CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Panel.primary(
                isLoading: isLoading,
                size: Size(double.infinity, 160),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Translated()!.salve),
                    SeparatedRow(
                      separatorBuilder: () => Gap(10),
                      children: [
                        Button.primary(
                          onPressed: () => settingsLogic.changeThemeMode(ThemeMode.light),
                          child: Text('Change Theme To Light',textAlign: TextAlign.center,)
                        ).expanded(),
                        Button.secondary(
                          onPressed: () => settingsLogic.changeThemeMode(ThemeMode.dark),
                          child: Text('Change Theme To dark', textAlign: TextAlign.center)
                        ).expanded(),
                      ],
                    ),
                    Gap(10),
                    Panel.secondary(
                      child: SeparatedRow(
                        separatorBuilder: () => Gap(10),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button.primary(
                                  onPressed: () => settingsLogic.changeLocale(
                                      context, Locale('en')),
                                  child: Text('Change Locale To EN'))
                              .expanded(),
                          Button.secondary(
                                  onPressed: () => settingsLogic.changeLocale(
                                      context, Locale('pt')),
                                  child: Text('Change Locale To PT'))
                              .expanded(),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            Image.network(
              'https://www.sefram.com/images/products/photos/hi_res/7352B.jpg',
              fit: BoxFit.fitHeight,
              height: 150,
              width: context.widthPx- 40,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Panel.primary(isLoading: true, size: Size(context.widthPx - 40, 140),);
              },
            ),

            Panel.secondary(
              child: Button.primary(
                child: Text('Show Dialog'),
                onPressed: () => CustomDialog(
                  child: Column(
                    children: [
                      Container(width: double.infinity, height: 50, color: Colors.grey,),
                      Gap(10),
                      Container(width: double.infinity, height: 50, color: Colors.grey,),
                    ],
                  ),
                ).show(context)
              ),
            ),

            Switch(
              value: true,
              onChanged: (_) {},
            ),
            CustomCheckBox(value: true, onChanged: (_) {})
          ],
        ),
      ),
    );
  }
}
