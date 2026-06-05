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

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  String get code => otpControllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ValidateOtpLoading || state is ResendOtpLoading) {
            UIUtils.showLoading(context);
          } else if (state is ValidateOtpSuccess) {
            UIUtils.hideLoading(context);
            Navigator.of(context).pushReplacementNamed(
              Routes.newPassword,
              arguments: {'code': code, 'email': widget.email},
            );
          } else if (state is ResendOtpSuccess) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage('code resent successfully');
          } else if (state is ValidateOtpError) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage(state.message);
          } else if (state is ResendOtpError) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage(state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                      style: getBoldStyle(color: ColorManager.secColor),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  "Enter the code we sent to your email address to reset your password.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.email,
                  style: getSemiBoldStyle(color: ColorManager.green),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptFiled(controller: otpControllers[0]),
                    OptFiled(controller: otpControllers[1]),
                    OptFiled(controller: otpControllers[2]),
                    OptFiled(controller: otpControllers[3]),
                    OptFiled(controller: otpControllers[4]),
                    OptFiled(controller: otpControllers[5]),
                  ],
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Verify Code',
                  onTap: () {
                    context.read<AuthCubit>().validateOtp(widget.email, code);
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
