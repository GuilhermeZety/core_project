import 'package:core_project/ui/components/panels.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.child, this.title});

  final Widget child;
  final Widget? title;

  Future show(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _content(context);
      }
    );
  }

  Widget _content(BuildContext context) => Container(
    margin: const EdgeInsets.all(20.0),
    child: Stack(
      children: [
        Container(
          width: 50, 
          height:50, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: () => Navigator.of(context).pop(),),
        ),
        BottomCenter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Panel.primary(
                  withShadow: false,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: title)
                  ),
                ),
              ),
              Panel.primary(
                  withShadow: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
            ],
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}