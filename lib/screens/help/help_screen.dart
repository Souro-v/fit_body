import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int _currentIndex = 3;
  String _selectedTab = 'FAQ';       // FAQ or Contact Us
  String _selectedCategory = 'General'; // General, Account, Services
  int? _expandedIndex;
  final _searchCtrl = TextEditingController();

  final _faqs = [
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Praesent pellentesque congue lorem, vel tincidunt tortor '
            'placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.'),
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    _Faq(q: 'Lorem ipsum dolor sit amet?',
        a: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
  ];

  final _contacts = [
    _Contact(icon: Icons.headset_mic_outlined, label: 'Customer service'),
    _Contact(icon: Icons.language_outlined,    label: 'Website'),
    _Contact(icon: Icons.chat_outlined,        label: 'Whatsapp'),
    _Contact(icon: Icons.facebook_outlined,    label: 'Facebook'),
    _Contact(icon: Icons.camera_alt_outlined,  label: 'Instagram'),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
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
            // ── Top bar ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: AppColors.yellow, size: 14),
                    Text('Help & FAQs',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── How Can We Help You ──────────────────────────
                    const Center(
                      child: Text('How Can We Help You?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),

                    const SizedBox(height: 16),

                    // ── FAQ / Contact Us tabs ────────────────────────
                    Row(
                      children: ['FAQ', 'Contact Us'].map((tab) {
                        final selected = _selectedTab == tab;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => _selectedTab = tab),
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: tab == 'FAQ' ? 8 : 0),
                              height: 44,
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: selected
                                      ? AppColors.yellow
                                      : Colors.white24,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(tab,
                                  style: TextStyle(
                                      color: selected
                                          ? Colors.black
                                          : Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    // ── FAQ tab content ──────────────────────────────
                    if (_selectedTab == 'FAQ') ...[
                      // Category tabs
                      Row(
                        children: ['General', 'Account', 'Services']
                            .map((cat) {
                          final selected = _selectedCategory == cat;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedCategory = cat),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: selected
                                      ? AppColors.yellow
                                      : Colors.white24,
                                ),
                              ),
                              child: Text(cat,
                                  style: TextStyle(
                                      color: selected
                                          ? Colors.black
                                          : Colors.white70,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 16),

                      // Search
                      TextField(
                        controller: _searchCtrl,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                          const TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.search,
                              color: Colors.black38, size: 20),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // FAQ list
                      ..._faqs.asMap().entries.map((entry) {
                        final i = entry.key;
                        final faq = entry.value;
                        final isExpanded = _expandedIndex == i;
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() =>
                              _expandedIndex =
                              isExpanded ? null : i),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(faq.q,
                                          style: TextStyle(
                                              color: isExpanded
                                                  ? AppColors.purple
                                                  : Colors.white,
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w500)),
                                    ),
                                    Icon(Icons.arrow_drop_down,
                                        color: AppColors.yellow,
                                        size: 24),
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded)
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 12),
                                child: Text(faq.a,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        height: 1.5)),
                              ),
                            const Divider(color: Colors.white12),
                          ],
                        );
                      }),
                    ],

                    // ── Contact Us tab content ───────────────────────
                    if (_selectedTab == 'Contact Us')
                      ..._contacts.asMap().entries.map((entry) {
                        final i = entry.key;
                        final contact = entry.value;
                        final isExpanded = _expandedIndex == i + 100;
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() =>
                              _expandedIndex =
                              isExpanded ? null : i + 100),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        color: AppColors.purple
                                            .withValues(alpha: 0.4),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(contact.icon,
                                          color: Colors.white,
                                          size: 20),
                                    ),
                                    const SizedBox(width: 14),
                                    Text(contact.label,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15)),
                                    const Spacer(),
                                    Icon(Icons.arrow_drop_down,
                                        color: AppColors.yellow,
                                        size: 24),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(color: Colors.white12),
                          ],
                        );
                      }),

                    const SizedBox(height: 24),
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

class _Faq {
  final String q;
  final String a;
  _Faq({required this.q, required this.a});
}

class _Contact {
  final IconData icon;
  final String label;
  _Contact({required this.icon, required this.label});
}