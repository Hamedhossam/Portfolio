import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/utils/download_helper_web.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';
import '../../../../core/utils/download_helper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjectsTap;

  const HeroSection({super.key, required this.onProjectsTap});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 120 : 60,
      ),
      constraints: const BoxConstraints(minHeight: 600),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildLeftColumn(isDesktop)),
                _buildRightColumn(),
              ],
            )
          : Column(
              children: [
                _buildRightColumn(),
                const SizedBox(height: 48),
                _buildLeftColumn(isDesktop),
              ],
            ),
    );
  }

  Widget _buildLeftColumn(bool isDesktop) {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm",
          style: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 16),
        ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: AppColors.electricBlueGradient,
              ).createShader(bounds),
              child: Text(
                StaticData.name,
                style: isDesktop
                    ? AppTextStyles.h1.copyWith(
                        color: Colors.white,
                        fontSize: 80,
                      )
                    : AppTextStyles.h1.copyWith(color: Colors.white),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideX(begin: -0.2, end: 0),
        const SizedBox(height: 24),
        SizedBox(
          height: 60,
          child: DefaultTextStyle(
            style: isDesktop
                ? AppTextStyles.h2.copyWith(color: AppColors.textPrimary)
                : AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Software Engineer',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Mobile App Architect',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          StaticData.title,
          style: AppTextStyles.bodyLg,
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
        const SizedBox(height: 40),
        Row(
              mainAxisAlignment: isDesktop
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onProjectsTap,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Text(
                        'View Projects',
                        style: AppTextStyles.button.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {
                    downloadCV();
                  },
                  child: Text(
                    'Download CV',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.electricBlueGradient.first,
                    ),
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(delay: 800.ms, duration: 600.ms)
            .slideY(begin: 0.3, end: 0),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.violetGradient.first.withOpacity(0.3),
                blurRadius: 100,
                spreadRadius: 20,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          ...AppColors.electricBlueGradient,
                          ...AppColors.violetGradient,
                          AppColors.electricBlueGradient.first,
                        ],
                      ),
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .rotate(duration: 10.seconds),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 145,
                  backgroundColor: AppColors.bgPrimary,
                  // TODO: replace with assets/images/profile.png
                  backgroundImage: AssetImage(
                    'assets/images/1738805907855.jpg',
                  ),
                  // child: const Icon(Icons.person, size: 100, color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: 400.ms, duration: 800.ms)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack)
        .then(delay: 200.ms)
        .moveY(
          begin: -10,
          end: 10,
          duration: 2.seconds,
          curve: Curves.easeInOutSine,
        )
        .then()
        .moveY(
          begin: 10,
          end: -10,
          duration: 2.seconds,
          curve: Curves.easeInOutSine,
        );
  }
}
