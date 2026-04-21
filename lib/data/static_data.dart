import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models/experience_model.dart';
import 'models/project_model.dart';
import 'models/skill_model.dart';

class StaticData {
  static const String name = 'Hamed Hossam';
  static const String title = 'Software Engineer & Flutter Developer';
  static const String email = 'hamedhossamelmarasy@gmail.com';
  static const String phone = '+20-106-387-6967';
  static const String linkedin = 'https://linkedin.com/in/hamed-hossam';
  static const String github = 'https://github.com/Hamedhossam';

  static const String profileSummary =
      'Software Engineer & Flutter Developer with 2+ years of experience designing, developing, and shipping production mobile applications published on Google Play and the App Store. Specialized in SaaS, E-commerce, CRM, and B2B platforms using Flutter, Dart, and clean architecture. Strong focus on performance, code quality, and user experience.';

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      company: 'AMAMI',
      role: 'Mobile Applications Developer',
      duration: 'Dec 2025 – Present',
      achievements: [
        'Missing Board App (Live on Play Store & App Store) — lost-and-found platform with interactive maps, multi-image uploads, push notifications',
        'Mini Market App (Live) — local shopping & delivery with real-time tracking, in-app chat with voice messages, multi-language (EN/AR)',
        'Contributed to SaaS & B2B systems, reduced manual processes ~25%',
        'Applied Clean Architecture + BLoC; cut code complexity',
        'Optimized performance, reduced screen load time ~20%',
        'Refactored legacy code, reduced duplication ~35%',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'BLoC',
        'Clean Architecture',
        'Google Maps',
        'Firebase',
      ],
    ),
    ExperienceModel(
      company: 'Rockai Dev',
      role: 'Flutter Developer',
      duration: 'Aug 2025 – Dec 2025',
      achievements: [
        'Propai CRM App (Live) — AI-powered real estate CRM with role-based access, analytics dashboards, AI-driven predictive actions',
        'Built E-commerce apps with secure payment gateways (98%+ success rate)',
        'Implemented BLoC architecture, reduced runtime bugs ~30%',
        'Integrated Firebase & Supabase for auth, realtime sync',
        'Resolved 50+ production bugs',
      ],
      techStack: ['Flutter', 'BLoC', 'Firebase', 'Supabase', 'REST API'],
    ),
  ];

  static List<SkillModel> skills = [
    SkillModel(
      name: 'Dart',
      icon: FontAwesomeIcons.code,
      category: 'Languages',
    ), // Will use flutter brands later, placeholder for now
    SkillModel(
      name: 'Java',
      icon: FontAwesomeIcons.java,
      category: 'Languages',
    ),
    SkillModel(
      name: 'Flutter',
      icon: FontAwesomeIcons.mobileButton,
      category: 'Mobile',
    ),
    SkillModel(
      name: 'Android',
      icon: FontAwesomeIcons.android,
      category: 'Mobile',
    ),
    SkillModel(
      name: 'BLoC',
      icon: FontAwesomeIcons.cubes,
      category: 'State Management',
    ),
    SkillModel(
      name: 'Provider',
      icon: FontAwesomeIcons.cubesStacked,
      category: 'State Management',
    ),
    SkillModel(
      name: 'Firebase',
      icon: FontAwesomeIcons.fire,
      category: 'Cloud',
    ),
    SkillModel(
      name: 'Supabase',
      icon: FontAwesomeIcons.database,
      category: 'Cloud',
    ),
    SkillModel(
      name: 'REST API',
      icon: FontAwesomeIcons.networkWired,
      category: 'Backend & APIs',
    ),
    SkillModel(
      name: 'Clean Architecture',
      icon: FontAwesomeIcons.layerGroup,
      category: 'Architecture',
    ),
    SkillModel(name: 'Git', icon: FontAwesomeIcons.gitAlt, category: 'Tools'),
    SkillModel(
      name: 'GitHub Actions',
      icon: FontAwesomeIcons.github,
      category: 'Tools',
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Missing Board',
      description:
          'Lost-and-found platform with interactive maps, multi-image uploads, and push notifications.',
      techStack: ['Flutter', 'Firebase', 'Google Maps'],
      imagePath:
          'assets/images/OcfM9k4S.jpg', // TODO: replace with assets/images/projects/missing_board.png
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.amami.missingboard.client', // placeholder
      appStoreUrl:
          'https://apps.apple.com/us/app/missing-board-client/id6759099311', // placeholder
    ),
    ProjectModel(
      title: 'Mini Market',
      description:
          'Local shopping & delivery with real-time tracking, in-app chat, and multi-language support.',
      techStack: ['Flutter', 'BLoC', 'WebSockets'],
      imagePath:
          'assets/images/Gemini_Generated_Image_h8o8agh8o8agh8o8.png', // TODO: replace with assets/images/projects/mini_market.png
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.ammami.minimarket',
      appStoreUrl:
          'https://apps.apple.com/us/app/mini-market/id6758721103', // placeholder
    ),
    ProjectModel(
      title: 'Propai CRM',
      description:
          'AI-powered real estate CRM with analytics dashboards and role-based access.',
      techStack: ['Flutter', 'Supabase', 'REST API'],
      imagePath:
          'assets/images/Gemini_Generated_Image_a1zjjxa1zjjxa1zj.png', // TODO: replace with assets/images/projects/propai_crm.png
      appStoreUrl: 'https://apps.apple.com/us/app/propai-crm/id6756882855',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.rocakaidev.crm_mobile_app',
    ),
    // ProjectModel(
    //   title: 'E-commerce App',
    //   description:
    //       'Shopping application featuring secure payment gateways and personalized recommendations.',
    //   techStack: ['Flutter', 'Firebase', 'Payment Gateway'],
    //   imagePath:
    //       'assets/images/projects/ecommerce.png', // TODO: replace with assets/images/projects/ecommerce.png
    // ),
  ];
}
