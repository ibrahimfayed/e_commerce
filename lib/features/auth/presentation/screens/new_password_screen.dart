import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/core/widgets/custom_auto_size_text.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  "Create a new password to log in to your account.",
                  style: getSemiBoldStyle(color: ColorManager.gradiant1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _passwordController,
                  hint: 'Enter New password',
                  backgroundColor: ColorManager.backgroundColor,
                  isObscured: true,
                  validation: Validator.validatePassword,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  borderBackgroundColor: ColorManager.border,
                  controller: _rePasswordController,
                  hint: 'Confirm your password',
                  backgroundColor: ColorManager.backgroundColor,
                  isObscured: true,
                  validation: (value) => Validator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
                const SizedBox(height: 32),
                CustomElevatedButton(
                  innerPadding: const EdgeInsets.all(16),
                  label: 'Confirm ',
                  onTap: () {},
                  isStadiumBorder: false,
                  radius: 16,
                  backgroundColor: ColorManager.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
