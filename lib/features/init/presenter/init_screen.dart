import 'package:core_project/core/common/translated.dart';
import 'package:core_project/features/init/cubit/init_cubit.dart';
import 'package:core_project/ui/components/bars/custom_bottom_appbar.dart';
import 'package:core_project/ui/components/buttons.dart';
import 'package:core_project/ui/components/custom_checkbox.dart';
import 'package:core_project/ui/dialogs/custom_dialogs.dart';
import 'package:core_project/ui/components/inputs/text_input.dart';
import 'package:core_project/ui/components/panels.dart';
import 'package:core_project/ui/components/subscaffold.dart';
import 'package:core_project/ui/dialogs/toasts.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';


import 'package:core_project/main.dart';
import 'package:gap/gap.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:sized_context/sized_context.dart';


class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  InitCubit cubit = InitCubit();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: subscaffold
    return SubScaffold(
      bottom: CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Panel.primary(
                isLoading: cubit.isLoading,
                size: Size(double.infinity, 160),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //TODO: Separeted Translated
                    Center(child: Text(Translated.salve)),
                    //TODO: Separeted Row
                    SeparatedRow(
                      //TODO: Gap
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
                            onPressed: () => settingsLogic.changeLocale(context, Locale('en')),
                            child: Text('Change Locale To EN')
                          ).expanded(),
                          Button.secondary(
                            onPressed: () => settingsLogic.changeLocale(context, Locale('pt')),
                            child: Text('Change Locale To PT')
                          ).expanded(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: context.widthPx,
              height: 220,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  Panel.primary(
                    child: Image.network(
                      'https://www.sefram.com/images/products/photos/hi_res/7352B.jpg',
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Panel.primary(isLoading: true,);
                      },
                    ),
                  ),
                  Panel.primary(
                    child: Image.network(
                      'https://www.sefram.com/images/products/photos/hi_res/7352B.jpg',
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Panel.primary(isLoading: true,);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Panel.primary(
              child: SimpleRichText(
                'Testando o ~{fontSize:16; color:#ff660000}RichText~ ', style: TextStyle(color: Colors.black),),
            ),
            Gap(10),
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
            Gap(10),
            Panel.secondary(
              child: Button.primary(
                child: Text('Show Toast'),
                onPressed: () => Toasting.showToast('Testando', Colors.green)
              ),
            ),
            Switch(
              value: true,
              onChanged: (_) {},
            ),
            CustomCheckBox(value: true, onChanged: (_) {}),
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInput(TextEditingController()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInput.password(TextEditingController(), label: Text('asdasds'),),
            ),
            SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
  
}
