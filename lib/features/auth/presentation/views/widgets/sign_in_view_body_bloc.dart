import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/custom_progress_hud.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInViewBodyBloc extends StatelessWidget {
  const SignInViewBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (BuildContext context, SignInState state) {
        if (state is SignInSuccess) {
          showSnackBar(context, 'Signed In Successfully');
          GoRouter.of(context).push(AppRouter.kHomeView);
        }

        if (state is SignInFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
