// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/auth_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePass   = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
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
              AuthTopBar(title: 'Log In', onBack: () => Navigator.pop(context)),

              const SizedBox(height: 36),

              // ── Welcome ─────────────────────────────────────────────────
              const Center(
                child: Text('Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n'
                      'sed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.6),
                ),
              ),

              const SizedBox(height: 32),

              // ── Input card ──────────────────────────────────────────────
              AuthCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthLabel('Username or email'),
                    AuthTextField(
                      controller: _emailCtrl,
                      hint: 'example@example.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    AuthLabel('Password'),
                    AuthTextField(
                      controller: _passwordCtrl,
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
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.forgotPassword),
                        child: const Text('Forgot Password?',
                            style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Log In button ────────────────────────────────────────────
              AuthPrimaryButton(
                label: 'Log In',
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
              ),

              const SizedBox(height: 20),

              // ── Social login ─────────────────────────────────────────────
              const AuthDivider(label: 'or sign up with'),
              const SizedBox(height: 16),
              const SocialButtons(),

              const SizedBox(height: 24),

              // ── Sign up link ─────────────────────────────────────────────
              Center(
                child: AuthSwitchText(
                  prefix: "Don't have an account? ",
                  actionText: 'Sign Up',
                  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.register),
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
