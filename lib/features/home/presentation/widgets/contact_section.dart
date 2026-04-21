import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Replace with mailto or API integration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Message sent successfully!',
            style: AppTextStyles.body,
          ),
          backgroundColor: AppColors.electricBlueGradient.first,
          behavior: SnackBarBehavior.floating,
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildLeft()),
                const SizedBox(width: 80),
                Expanded(child: _buildForm()),
              ],
            )
          : Column(
              children: [
                _buildLeft(),
                const SizedBox(height: 60),
                _buildForm(),
              ],
            ),
    );
  }

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Let's build something great", style: AppTextStyles.h2),
        Container(
          height: 4,
          width: 80,
          margin: const EdgeInsets.only(top: 8, bottom: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppColors.violetGradient),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Text(
          "I'm currently open for new opportunities. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
          style: AppTextStyles.bodyLg,
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedin, StaticData.linkedin),
            const SizedBox(width: 24),
            _buildSocialIcon(FontAwesomeIcons.github, StaticData.github),
            const SizedBox(width: 24),
            _buildSocialIcon(
              FontAwesomeIcons.envelope,
              'mailto:${StaticData.email}',
            ),
          ],
        ),
      ],
    ).animate().fade().slideX(begin: -0.2);
  }

  Widget _buildSocialIcon(dynamic icon, String url) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () => _launchUrl(url),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isHovered
                    ? AppColors.electricBlueGradient.first.withOpacity(0.2)
                    : AppColors.surfaceColor,
                border: Border.all(
                  color: isHovered
                      ? AppColors.electricBlueGradient.first
                      : AppColors.borderColor,
                ),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.electricBlueGradient.first
                              .withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: FaIcon(icon, color: Colors.white, size: 24),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTextField(
              controller: _nameController,
              label: 'Name',
              validator: (v) => v!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              validator: (v) => v!.isEmpty
                  ? 'Please enter your email'
                  : (!v.contains('@') ? 'Invalid email' : null),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              maxLines: 5,
              validator: (v) => v!.isEmpty ? 'Please enter your message' : null,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.electricBlueGradient,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: Text(
                      'Send Message',
                      style: AppTextStyles.button.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fade().slideX(begin: 0.2);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.bgPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.electricBlueGradient.first),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
