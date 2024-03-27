import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/app/design_system/design_system.dart';

import '../../app_bloc/app_bloc.dart';
import '../../navigation/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBlocHelper.getLogInCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome'.tr())),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.navigate(const MainRoute());
          },
          child: const Text('Body'),
        ),
      ),
    );
  }
}
