import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocBuilder extends StatelessWidget {
  const SignUpViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showSnackBar(context, 'Signed Up Successfully');
          Navigator.pop(context);
        }
        if (state is SignUpFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading ? true : false,
            child: const SignUpViewBody());
      },
    );
  }
}
