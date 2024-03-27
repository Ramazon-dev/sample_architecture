import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app_bloc/app_bloc.dart';

@RoutePage()
class MainWrapper extends AutoRouter implements AutoRouteWrapper {
  const MainWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBlocHelper.getLogInCubit(),
        ),
        BlocProvider(
          create: (context) => AppBlocHelper.getAuthCubit(),
        ),
      ],
      child: this,
    );
  }
}

@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // context.read<LoginCubit>().login();
                context.read<AuthCubit>().fetch();
              },
              child: const Text('valyuta kurslari'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().fetch();
              },
              child: const Text('nmadur data'),
            )
          ],
        ),
      ),
    );
  }
}
