import 'package:ev_charging/core/services/get_it_service.dart';
import 'package:ev_charging/features/auth/domain/repos/auth_repo.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/sign_in_view_body_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
        ),
        body: const SignInViewBodyBloc(),
      ),
    );
  }
}
