import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/custom_auto_size_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/opt_filed.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  
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
      body: Padding(
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
                    style: getBoldStyle(color: ColorManager.orange),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "Enter the code we sent to your email address to reset your password.",
                style: getSemiBoldStyle(color: ColorManager.gradiant1),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptFiled(),
                  OptFiled(),
                  OptFiled(),
                  OptFiled(),
                ],
              ),
              const SizedBox(height: 32),
              CustomElevatedButton(
                innerPadding: const EdgeInsets.all(16),
                label: 'Verify Code',
                onTap: () =>
                    Navigator.of(context).pushNamed(Routes.newPassword),
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
                    onTap: () {},
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
    );
  }
}
