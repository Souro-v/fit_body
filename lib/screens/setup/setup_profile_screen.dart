import 'package:fit_body/screens/setup/setup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../routes/app_routes.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final _nameCtrl    = TextEditingController();
  final _nickCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _mobileCtrl  = TextEditingController();
  File? _photo;

  Future<void> _pickPhoto() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _photo = File(picked.path));
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _nickCtrl.dispose();
    _emailCtrl.dispose();
    _mobileCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1025),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    SetupBackButton(),
                    const SizedBox(height: 32),
                    const Center(
                      child: Text('Fill Your Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                            'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),

              // Profile photo section
              Container(
                width: double.infinity,
                color: const Color(0xFFB39DDB).withValues(alpha: 0.35),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundColor: const Color(0xFF2A1F3D),
                        backgroundImage: _photo != null ? FileImage(_photo!) : null,
                        child: _photo == null
                            ? const Icon(Icons.person, color: Colors.white38, size: 52)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickPhoto,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8E44A),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit, color: Colors.black, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _ProfileField(label: 'Full name', controller: _nameCtrl, hint: 'Madison Smith'),
                    const SizedBox(height: 16),
                    _ProfileField(label: 'Nickname', controller: _nickCtrl, hint: 'Madison'),
                    const SizedBox(height: 16),
                    _ProfileField(label: 'Email', controller: _emailCtrl, hint: 'madisons@example.com',
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 16),
                    _ProfileField(label: 'Mobile Number', controller: _mobileCtrl,
                        hint: '+123 567 89000', keyboardType: TextInputType.phone),
                    const SizedBox(height: 32),

                    // Start button
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E44A),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: const Text('Start',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.controller,
    required this.hint,
    this.keyboardType,
  });
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Color(0xFFE8E44A), fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}