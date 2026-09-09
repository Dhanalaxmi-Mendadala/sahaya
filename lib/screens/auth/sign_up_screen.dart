import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common/custom_button.dart';
import 'profile_setup_screen.dart';

class SignUpScreen extends StatelessWidget {
  final bool isLogin;
  const SignUpScreen({super.key, this.isLogin = false});

  void _continue(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileSetupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(isLogin ? 'Login' : 'Create Account',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 32),
            CustomButton(
              label: 'Sign up with Phone Number',
              icon: Icons.phone_outlined,
              outlined: true,
              onPressed: () => _continue(context),
            ),
            const SizedBox(height: 14),
            CustomButton(
              label: 'Sign up with Email',
              icon: Icons.email_outlined,
              outlined: true,
              onPressed: () => _continue(context),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('or', style: TextStyle(color: AppColors.textHint)),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Continue with Google',
              icon: Icons.g_mobiledata,
              outlined: true,
              onPressed: () => _continue(context),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                'By continuing, you agree to our Terms & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textHint),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
