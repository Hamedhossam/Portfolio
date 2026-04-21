import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';
import '../../../../data/models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: AppTextStyles.h2),
          Container(
            height: 4,
            width: 80,
            margin: const EdgeInsets.only(top: 8, bottom: 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.electricBlueGradient),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: StaticData.experiences.length,
            itemBuilder: (context, index) {
              return _buildExperienceItem(StaticData.experiences[index], isDesktop, index).animate().fade(delay: (200 * index).ms).slideX(begin: 0.2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(ExperienceModel exp, bool isDesktop, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop) ...[
            SizedBox(
              width: 200,
              child: Text(
                exp.duration,
                style: AppTextStyles.body.copyWith(color: AppColors.electricBlueGradient.first),
              ),
            ),
            _buildTimelineNode(),
            const SizedBox(width: 32),
          ],
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exp.role, style: AppTextStyles.h3),
                  const SizedBox(height: 8),
                  Text(
                    exp.company,
                    style: AppTextStyles.h4.copyWith(color: AppColors.textSecondary),
                  ),
                  if (!isDesktop) ...[
                    const SizedBox(height: 8),
                    Text(
                      exp.duration,
                      style: AppTextStyles.body.copyWith(color: AppColors.electricBlueGradient.first),
                    ),
                  ],
                  const SizedBox(height: 16),
                  ...exp.achievements.map((ach) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("• ", style: AppTextStyles.bodyLg.copyWith(color: AppColors.electricBlueGradient.first)),
                            Expanded(child: Text(ach, style: AppTextStyles.body)),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: exp.techStack.map((tech) => _buildTechChip(tech)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode() {
    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.bgPrimary,
            border: Border.all(color: AppColors.electricBlueGradient.first, width: 4),
          ),
        ),
      ],
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(tech, style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary)),
    );
  }
}
