import 'package:ev_charging/core/utils/get_it_service.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/sign_up_view_body_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Account'),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: SignUpViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}
