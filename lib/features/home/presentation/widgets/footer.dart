import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Column(
        children: [
          Text(
            '© ${DateTime.now().year} Hamed Hossam. All rights reserved.',
            style: AppTextStyles.bodySm,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Built with ', style: AppTextStyles.bodySm),
              const Icon(Icons.favorite, color: Colors.blue, size: 16),
              Text(' Flutter', style: AppTextStyles.bodySm.copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
