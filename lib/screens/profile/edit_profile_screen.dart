
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../models/user_data.dart';
import '../../widgets/app_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _user = UserData();
  late final _nameCtrl    = TextEditingController(text: _user.name);
  late final _emailCtrl   = TextEditingController(text: _user.email);
  late final _mobileCtrl  = TextEditingController(text: _user.mobile);
  late final _dobCtrl     = TextEditingController(text: _user.birthday);
  late final _weightCtrl  = TextEditingController(text: _user.weight);
  late final _heightCtrl  = TextEditingController(text: _user.height);
  File? _photo;

  Future<void> _pickPhoto() async {
    final picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _photo = File(picked.path));
  }

  void _save() {
    _user.update(
      name: _nameCtrl.text,
      email: _emailCtrl.text,
      mobile: _mobileCtrl.text,
      birthday: _dobCtrl.text,
      weight: _weightCtrl.text,
      height: _heightCtrl.text,
      profilePhoto: _photo,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _mobileCtrl.dispose();
    _dobCtrl.dispose();
    _weightCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // ── Purple header ──────────────────────────────────────────────
          Container(
            color: AppColors.purple.withValues(alpha: 0.4),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios,
                                color: AppColors.yellow, size: 14),
                            Text('My Profile',
                                style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Profile photo + edit button
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundColor: AppColors.card,
                        backgroundImage: _photo != null
                            ? FileImage(_photo!)
                            : _user.profilePhoto != null
                            ? FileImage(_user.profilePhoto!)
                            : const AssetImage(
                            'assets/images/profile_photo.png')
                        as ImageProvider,
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
                              color: AppColors.yellow,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit,
                                color: Colors.black, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(_user.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(_user.email,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Birthday: April 1st',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 12)),

                  const SizedBox(height: 16),

                  // Stats bar
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _StatItem(label: 'Weight', value: _user.weight),
                        Container(width: 1, height: 30, color: Colors.white24),
                        _StatItem(label: 'Years Old', value: '${_user.age}'),
                        Container(width: 1, height: 30, color: Colors.white24),
                        _StatItem(label: 'Height', value: _user.height),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // ── Form ───────────────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  AppInputField(
                      label: 'Full name',
                      controller: _nameCtrl,
                      hint: 'Madison Smith'),
                  const SizedBox(height: 16),
                  AppInputField(
                      label: 'Email',
                      controller: _emailCtrl,
                      hint: 'madisons@example.com',
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  AppInputField(
                      label: 'Mobile Number',
                      controller: _mobileCtrl,
                      hint: '+123 567 89000',
                      keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),
                  AppInputField(
                      label: 'Date of birth',
                      controller: _dobCtrl,
                      hint: '01 / 04 / 199X'),
                  const SizedBox(height: 16),
                  AppInputField(
                      label: 'Weight',
                      controller: _weightCtrl,
                      hint: '75 Kg',
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 16),
                  AppInputField(
                      label: 'Height',
                      controller: _heightCtrl,
                      hint: '1.65 CM',
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 32),
                  AppPrimaryButton(
                    label: 'Update Profile',
                    onTap: _save,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }
}