import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/widgets/custom_auto_size_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:e_commerce/features/auth/presentation/widgets/opt_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width * .12;

    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is VerifyEmailLoading || state is ResendOtpLoading) {
                UIUtils.showLoading(context);
              } else if (state is VerifyEmailSuccess) {
                UIUtils.hideLoading(context);
                Navigator.of(context).pushReplacementNamed(Routes.login);
                UIUtils.showMessage(
                  'email verified successfully, you can login now',
                );
              } else if (state is ResendOtpSuccess) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage('code resent successfully');
              } else if (state is VerifyEmailError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.message);
              } else if (state is ResendOtpError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.message);
              }
            },
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    CustomAutoSizeText(
                      data: 'welcome to',
                      textStyle: getBoldStyle(color: ColorManager.gradiant1),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Accessory',
                      style: getBoldStyle(color: ColorManager.green),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'HUB',
                      style: getBoldStyle(color: ColorManager.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  "Enter the code we sent to your email address to verify your email.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptFiled(size: boxSize, controller: otpControllers[0]),
                    OptFiled(size: boxSize, controller: otpControllers[1]),
                    OptFiled(size: boxSize, controller: otpControllers[2]),
                    OptFiled(size: boxSize, controller: otpControllers[3]),
                    OptFiled(size: boxSize, controller: otpControllers[4]),
                    OptFiled(size: boxSize, controller: otpControllers[5]),
                  ],
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Verify Email',
                  onTap: () {
                    final code = otpControllers.map((c) => c.text).join();

                    context.read<AuthCubit>().verifyEmail(widget.email, code);
                  },
                  isStadiumBorder: false,
                  radius: 16,
                  backgroundColor: ColorManager.green,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: getSemiBoldStyle(color: ColorManager.gradiant1),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        context.read<AuthCubit>().resendOtp(widget.email);
                      },
                      child: Text(
                        'Resend Code',
                        style: getSemiBoldStyle(color: ColorManager.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
