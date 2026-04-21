import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/download_helper_stub.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';

class Navbar extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;

  const Navbar({super.key, required this.sectionKeys});

  void _scrollToSection(String keyName) {
    final key = sectionKeys[keyName];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        color: AppColors.surfaceColor.withOpacity(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            if (ResponsiveHelper.isDesktop(context) ||
                ResponsiveHelper.isTablet(context))
              Row(
                children: [
                  _navItem('Home', 'home'),
                  _navItem('About', 'about'),
                  _navItem('Skills', 'skills'),
                  _navItem('Experience', 'experience'),
                  _navItem('Projects', 'projects'),
                  _navItem('Contact', 'contact'),
                  const SizedBox(width: 24),
                  _buildDownloadCvButton(),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: AppColors.electricBlueGradient,
      ).createShader(bounds),
      child: Text('HH', style: AppTextStyles.h3.copyWith(color: Colors.white)),
    );
  }

  Widget _navItem(String title, String keyName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () => _scrollToSection(keyName),
        child: Text(
          title,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadCvButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: AppColors.violetGradient),
      ),
      padding: const EdgeInsets.all(2), // Gradient border width
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            downloadCV();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            'Download CV',
            style: AppTextStyles.button.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  }
}
