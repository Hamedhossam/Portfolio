import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';
import '../../../../data/models/skill_model.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final categories = StaticData.skills.map((e) => e.category).toSet().toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Technical Skills", style: AppTextStyles.h2),
          Container(
            height: 4,
            width: 80,
            margin: const EdgeInsets.only(top: 8, bottom: 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.violetGradient),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: categories.map((c) => _buildCategory(c, isDesktop)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String category, bool isDesktop) {
    final categorySkills = StaticData.skills.where((s) => s.category == category).toList();
    return SizedBox(
      width: isDesktop ? 300 : double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: AppTextStyles.h4),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: categorySkills.map((skill) => _buildSkillChip(skill)).toList(),
          ),
        ],
      ),
    ).animate().fade().slideY(begin: 0.2);
  }

  Widget _buildSkillChip(SkillModel skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(skill.icon, size: 20, color: AppColors.electricBlueGradient.first),
          const SizedBox(width: 8),
          Text(skill.name, style: AppTextStyles.bodySm.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

