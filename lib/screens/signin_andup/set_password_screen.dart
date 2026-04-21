// lib/screens/set_password_screen.dart

import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/auth_widgets.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passCtrl    = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscurePass    = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _passCtrl.dispose();
    _confirmCtrl.dispose();
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
                title: 'Set Password',
                onBack: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              // ── Sub text ─────────────────────────────────────────────────
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.6),
              ),

              const SizedBox(height: 32),

              // ── Input card ───────────────────────────────────────────────
              AuthCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 16),
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

              const SizedBox(height: 32),

              // ── Reset Password button ────────────────────────────────────
              AuthPrimaryButton(
                label: 'Reset Password',
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
