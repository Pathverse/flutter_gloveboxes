import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro/cubit.dart';
import 'package:pvtro_common/i18n/strings.g.dart';
import '../pvtro.unified_lang.dart';

class PvtroStatsCard extends StatelessWidget {
  const PvtroStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit<UnifiedLanguage>, UnifiedLanguage>(
      builder: (context, currentLocale) {
        return ShadCard(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.analytics, size: 28, color: Colors.green),
                    const SizedBox(width: 12),
                    Text(
                      'Pvtro System Status',
                      style: ShadTheme.of(context).textTheme.h3,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Stats Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                      3.0, // Increased aspect ratio to give more width
                  children: [
                    _buildStatItem(
                      context,
                      'Current Language',
                      currentLocale.name.toUpperCase(),
                      Icons.language,
                      Colors.blue,
                    ),
                    _buildStatItem(
                      context,
                      'Language Code',
                      context
                          .read<LocaleCubit<UnifiedLanguage>>()
                          .currentLanguageCode,
                      Icons.code,
                      Colors.orange,
                    ),
                    _buildStatItem(
                      context,
                      'Packages Coordinated',
                      '2',
                      Icons.inventory,
                      Colors.purple,
                    ),
                    _buildStatItem(
                      context,
                      'Total Languages',
                      '${UnifiedLanguage.values.length}',
                      Icons.public,
                      Colors.teal,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Package List
                Text(
                  'Coordinated Packages:',
                  style: ShadTheme.of(
                    context,
                  ).textTheme.small.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                _buildPackageChip(
                  'pvtro_common',
                  'Common translations',
                  Colors.blue,
                ),
                const SizedBox(height: 8),
                _buildPackageChip(
                  'pvtro_conver',
                  'Unit conversions',
                  Colors.green,
                ),

                const SizedBox(height: 20),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  child: ShadButton.outline(
                    onPressed: () => _showLanguageList(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.list, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'View All ${UnifiedLanguage.values.length} Languages',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(8), // Reduced padding
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Take minimum space
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color), // Smaller icon
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    fontSize: 10, // Smaller font
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: ShadTheme.of(context).textTheme.small.copyWith(
              // Use small instead of h4
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageChip(
    String packageName,
    String description,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10), // Reduced padding
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.inventory_2, size: 14, color: color), // Smaller icon
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  packageName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: color,
                  ),
                ),
                const SizedBox(height: 2), // Add small spacing
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10, // Smaller font
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageList(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('All Supported Languages'),
        description: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pvtro automatically discovered and unified these languages:',
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: UnifiedLanguage.values.map((lang) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          Icon(
                            context
                                        .read<LocaleCubit<UnifiedLanguage>>()
                                        .state ==
                                    lang
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            size: 16,
                            color:
                                context
                                        .read<LocaleCubit<UnifiedLanguage>>()
                                        .state ==
                                    lang
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text('${lang.name} (${lang.languageCode})'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.pvtroCommon.buttons.close),
          ),
        ],
      ),
    );
  }
}
