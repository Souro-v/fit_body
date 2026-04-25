
import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class PasswordSettingsScreen extends StatefulWidget {
  const PasswordSettingsScreen({super.key});

  @override
  State<PasswordSettingsScreen> createState() =>
      _PasswordSettingsScreenState();
}

class _PasswordSettingsScreenState extends State<PasswordSettingsScreen> {
  int _currentIndex = 3;

  final _currentCtrl = TextEditingController();
  final _newCtrl     = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew     = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: AppColors.yellow, size: 14),
                    Text('Password Settings',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Current Password
                    const Text('Current Password',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _currentCtrl,
                      obscure: _obscureCurrent,
                      onToggle: () => setState(
                              () => _obscureCurrent = !_obscureCurrent),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.forgotPassword),
                        child: const Text('Forgot Password?',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 12)),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // New Password
                    const Text('New Password',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _newCtrl,
                      obscure: _obscureNew,
                      onToggle: () =>
                          setState(() => _obscureNew = !_obscureNew),
                    ),

                    const SizedBox(height: 24),

                    // Confirm New Password
                    const Text('Confirm New Password',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _confirmCtrl,
                      obscure: _obscureConfirm,
                      onToggle: () => setState(
                              () => _obscureConfirm = !_obscureConfirm),
                    ),

                    const SizedBox(height: 48),

                    // Change Password button
                    AppPrimaryButton(
                      label: 'Change Password',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
    required this.obscure,
    required this.onToggle,
  });
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.black38,
            size: 20,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}