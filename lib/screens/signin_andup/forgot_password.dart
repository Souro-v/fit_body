// lib/screens/forgot_password_screen.dart

import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/auth_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── Top bar ─────────────────────────────────────────────────
              AuthTopBar(
                title: 'Forgotten Password',
                onBack: () => Navigator.pop(context),
              ),

              const SizedBox(height: 60),

              // ── Heading ──────────────────────────────────────────────────
              const Center(
                child: Text('Forgot Password?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n'
                      'sed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.6),
                ),
              ),

              const SizedBox(height: 40),

              // ── Email input ──────────────────────────────────────────────
              AuthCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthLabel('Enter your email address'),
                    AuthTextField(
                      controller: _emailCtrl,
                      hint: 'example@example.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Continue button ──────────────────────────────────────────
              AuthPrimaryButton(
                label: 'Continue',
                onTap: () => Navigator.pushNamed(context, AppRoutes.setPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
