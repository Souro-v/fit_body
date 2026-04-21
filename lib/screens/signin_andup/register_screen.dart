// lib/screens/register_screen.dart

import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/auth_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtrl     = TextEditingController();
  final _emailCtrl    = TextEditingController();
  final _passCtrl     = TextEditingController();
  final _confirmCtrl  = TextEditingController();
  bool _obscurePass    = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── Top bar ─────────────────────────────────────────────────
              AuthTopBar(title: 'Create Account', onBack: () => Navigator.pop(context)),

              const SizedBox(height: 28),

              // ── Sub heading ─────────────────────────────────────────────
              const Center(
                child: Text("Let's Start!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),

              const SizedBox(height: 24),

              // ── Input card ──────────────────────────────────────────────
              AuthCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthLabel('Full name'),
                    AuthTextField(
                      controller: _nameCtrl,
                      hint: 'example@example.com',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 14),
                    AuthLabel('Email or Mobile Number'),
                    AuthTextField(
                      controller: _emailCtrl,
                      hint: '+123 567 89000',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    AuthLabel('Password'),
                    AuthTextField(
                      controller: _passCtrl,
                      hint: '••••••••••••',
                      obscure: _obscurePass,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePass ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white54, size: 20,
                        ),
                        onPressed: () => setState(() => _obscurePass = !_obscurePass),
                      ),
                    ),
                    const SizedBox(height: 14),
                    AuthLabel('Confirm Password'),
                    AuthTextField(
                      controller: _confirmCtrl,
                      hint: '••••••••••••',
                      obscure: _obscureConfirm,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white54, size: 20,
                        ),
                        onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Terms ────────────────────────────────────────────────────
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                    children: [
                      TextSpan(text: 'By continuing, you agree to our '),
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                            color: AppColors.accent,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            color: AppColors.accent,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Sign Up button ───────────────────────────────────────────
              AuthPrimaryButton(
                label: 'Sign Up',
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
              ),

              const SizedBox(height: 20),

              // ── Social ───────────────────────────────────────────────────
              const AuthDivider(label: 'or sign up with'),
              const SizedBox(height: 16),
              const SocialButtons(),

              const SizedBox(height: 20),

              // ── Log in link ──────────────────────────────────────────────
              Center(
                child: AuthSwitchText(
                  prefix: 'Already have an account? ',
                  actionText: 'Log in',
                  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
