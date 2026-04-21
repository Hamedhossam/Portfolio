import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          Text("About Me", style: AppTextStyles.h2),
          Container(
            height: 4,
            width: 80,
            margin: const EdgeInsets.only(top: 8, bottom: 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.cyanGlowGradient),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    StaticData.profileSummary,
                    style: AppTextStyles.bodyLg,
                  ).animate().fade(duration: 800.ms).slideX(),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 4,
                  child: _buildStatsGrid(),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StaticData.profileSummary,
                  style: AppTextStyles.bodyLg,
                ).animate().fade(duration: 800.ms).slideX(),
                const SizedBox(height: 48),
                _buildStatsGrid(),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _buildStatCard('2+', 'Years Experience', Icons.timer),
        _buildStatCard('10+', 'Production Features', Icons.star),
        _buildStatCard('4+', 'Live Apps', Icons.apps),
        _buildStatCard('50+', 'Bugs Resolved', Icons.bug_report),
      ],
    ).animate().fade(delay: 200.ms, duration: 800.ms).slideY();
  }

  Widget _buildStatCard(String value, String label, dynamic icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: AppColors.electricBlueGradient,
            ).createShader(bounds),
            child: Icon(icon, size: 32, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(value, style: AppTextStyles.h3),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.bodySm),
        ],
      ),
    );
  }
}
