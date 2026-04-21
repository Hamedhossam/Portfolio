import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/widgets/about_section.dart';
import 'package:portfolio/features/home/presentation/widgets/animated_background.dart';
import 'package:portfolio/features/home/presentation/widgets/contact_section.dart';
import 'package:portfolio/features/home/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/home/presentation/widgets/footer.dart';
import 'package:portfolio/features/home/presentation/widgets/hero_section.dart';
import 'package:portfolio/features/home/presentation/widgets/navbar.dart';
import 'package:portfolio/features/home/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/home/presentation/widgets/skills_section.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String keyName) {
    final key = _sectionKeys[keyName];
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
    return Scaffold(
      endDrawer: _buildMobileDrawer(),
      body: Stack(
        children: [
          const AnimatedBackground(),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 100), // padding for fixed navbar
                    HeroSection(
                      key: _sectionKeys['home'],
                      onProjectsTap: () => _scrollToSection('projects'),
                    ),
                    AboutSection(key: _sectionKeys['about']),
                    SkillsSection(key: _sectionKeys['skills']),
                    ExperienceSection(key: _sectionKeys['experience']),
                    ProjectsSection(key: _sectionKeys['projects']),
                    ContactSection(key: _sectionKeys['contact']),
                    const Footer(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(sectionKeys: _sectionKeys),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppColors.surfaceColor,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 48),
          _drawerItem('Home', 'home'),
          _drawerItem('About', 'about'),
          _drawerItem('Skills', 'skills'),
          _drawerItem('Experience', 'experience'),
          _drawerItem('Projects', 'projects'),
          _drawerItem('Contact', 'contact'),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, String keyName) {
    return ListTile(
      title: Text(title, style: AppTextStyles.h4),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(keyName);
      },
    );
  }
}
