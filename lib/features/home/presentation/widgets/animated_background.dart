import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Container(color: AppColors.bgPrimary),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1 * _animation.value,
              left: MediaQuery.of(context).size.width * 0.2 * _animation.value,
              child: _buildBlob(AppColors.electricBlueGradient.first.withOpacity(0.15), 400),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2 * (1 - _animation.value),
              right: MediaQuery.of(context).size.width * 0.1 * (1 - _animation.value),
              child: _buildBlob(AppColors.violetGradient.first.withOpacity(0.15), 500),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              left: MediaQuery.of(context).size.width * 0.6 * _animation.value,
              child: _buildBlob(AppColors.cyanGlowGradient.first.withOpacity(0.1), 300),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBlob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
