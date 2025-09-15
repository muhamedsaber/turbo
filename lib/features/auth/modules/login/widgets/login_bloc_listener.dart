
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo/config/router/routes.dart';
import 'package:turbo/core/utils/app_dialog.dart';
import 'package:turbo/features/auth/modules/login/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: SizedBox.shrink(),
      listener: (context, state) {
      if (state is LoginError) {
         AppDialog().showApiError(context, state.error);
      }else if(state is LoginSuccess){
        // i want to navigate to HomeView using navigator  and remove all previous routes
        Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);

      }
    });
  }
}
