import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_project/core/common/constants/app_assets.dart';
import 'package:core_project/core/common/input_validations.dart';
import 'package:core_project/features/auth/presenter/cubits/auth_cubit.dart';
import 'package:core_project/ui/components/inputs/text_input.dart';
import 'package:core_project/ui/components/panels.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:core_project/ui/components/buttons.dart';
import 'package:go_router/go_router.dart';

import 'package:core_project/routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthCubit cubit = AuthCubit();

  @override
  void initState() {
    log('init');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Hero(
                  tag: 'logo',
                  child: TopCenter(child: Image.asset(AppAssets.logo, width: 100, color: Theme.of(context).colorScheme.inverseSurface))
                ),
              ),
            ),
            BottomCenter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    child: Panel.primary(
                      child: SizedBox(
                        height: 300,
                        child: BlocConsumer<AuthCubit, AuthState>(
                          bloc: cubit,
                          listener: (context, state) {
                            if (state is AuthSuccess) {
                              context.go(Routes.home);
                            }
                            if (state is AuthError) {
                              setState(() {});
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return Center(child: LoadingAnimationWidget.stretchedDots(color: Theme.of(context).colorScheme.inverseSurface, size: 60));
                            }
                            return Column(
                              children: [
                                Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Gap(20),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Form(
                                    key: cubit.formKey,
                                    autovalidateMode: cubit.formValidated ? AutovalidateMode.onUserInteraction : null,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextInput(
                                          cubit.emailController, 
                                          validation: InputValidations.inputEmailValidation, 
                                          label: Text('Email'),
                                        ),
                                        Gap(10),
                                        TextInput.password(
                                          cubit.passwordController, 
                                          label: Text('Senha'),
                                          validation: InputValidations.inputPasswordValidation,
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Button.primary(onPressed: cubit.login, child: Text('Login')).expanded(),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Forgot password?'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}