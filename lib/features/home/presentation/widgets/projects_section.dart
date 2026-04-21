import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../data/static_data.dart';
import '../../../../data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Featured Projects", style: AppTextStyles.h2),
          Container(
            height: 4,
            width: 80,
            margin: const EdgeInsets.only(top: 8, bottom: 48),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.cyanGlowGradient),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 2 : (isTablet ? 2 : 1),
              childAspectRatio: isDesktop ? 1.4 : 1.0,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
            ),
            itemCount: StaticData.projects.length,
            itemBuilder: (context, index) {
              return _buildProjectCard(StaticData.projects[index]).animate().fade(delay: (100 * index).ms).slideY(begin: 0.2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectModel project) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(0, isHovered ? -10 : 0, 0),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHovered ? AppColors.electricBlueGradient.first : AppColors.borderColor,
                width: isHovered ? 2 : 1,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.electricBlueGradient.first.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      color: AppColors.bgSecondary,
                      // TODO: replace placeholder with NetworkImage or AssetImage based on imagePath
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(Icons.image, size: 64, color: AppColors.textMuted.withOpacity(0.5)),
                          ),
                          if (isHovered)
                            Container(
                              color: AppColors.bgPrimary.withOpacity(0.8),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (project.playStoreUrl != null)
                                      IconButton(
                                        icon: const FaIcon(FontAwesomeIcons.googlePlay, color: Colors.white, size: 32),
                                        onPressed: () => _launchUrl(project.playStoreUrl!),
                                      ),
                                    if (project.appStoreUrl != null) ...[
                                      const SizedBox(width: 24),
                                      IconButton(
                                        icon: const FaIcon(FontAwesomeIcons.appStoreIos, color: Colors.white, size: 32),
                                        onPressed: () => _launchUrl(project.appStoreUrl!),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.title, style: AppTextStyles.h4),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              project.description,
                              style: AppTextStyles.bodySm,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: project.techStack
                                .take(3)
                                .map((tech) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        tech,
                                        style: AppTextStyles.bodySm.copyWith(color: AppColors.violetGradient.first),
                                      ),
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
