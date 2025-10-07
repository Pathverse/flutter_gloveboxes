import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:pvtro_common/i18n/strings.g.dart';

class ConversionSection extends StatefulWidget {
  const ConversionSection({super.key});

  @override
  State<ConversionSection> createState() => _ConversionSectionState();
}

class _ConversionSectionState extends State<ConversionSection> {
  String selectedUnit = 'length';
  final TextEditingController _valueController = TextEditingController();
  String convertedValue = '';

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.swap_horiz, size: 28, color: Colors.blue),
                const SizedBox(width: 12),
                Text(
                  'Unit Conversions',
                  style: ShadTheme.of(context).textTheme.h3,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Convert between different units using pvtro_conver package translations.',
              style: ShadTheme.of(context).textTheme.p.copyWith(
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 24),

            // Unit Type Selection
            Row(
              children: [
                Text(
                  '${context.pvtroCommon.commonWebFeatures.filter}: ',
                  style: ShadTheme.of(
                    context,
                  ).textTheme.small.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ShadSelect<String>(
                    placeholder: const Text('Select unit type'),
                    initialValue: selectedUnit,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedUnit = value;
                          convertedValue = '';
                        });
                      }
                    },
                    selectedOptionBuilder: (context, value) =>
                        Text(_getUnitTypeName(value)),
                    options: const [
                      ShadOption(value: 'length', child: Text('Length')),
                      ShadOption(value: 'weight', child: Text('Weight')),
                      ShadOption(
                        value: 'temperature',
                        child: Text('Temperature'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Input Field
            ShadInput(
              controller: _valueController,
              placeholder: const Text('Enter value to convert'),
              keyboardType: TextInputType.number,
              onChanged: (value) => _performConversion(),
            ),

            const SizedBox(height: 16),

            // Result Display
            if (convertedValue.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ShadTheme.of(
                    context,
                  ).colorScheme.accent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ShadTheme.of(context).colorScheme.border,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conversion Result:',
                      style: ShadTheme.of(
                        context,
                      ).textTheme.small.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      convertedValue,
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                ShadButton(
                  onPressed: _performConversion,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calculate, size: 16),
                      const SizedBox(width: 8),
                      const Text('Convert'),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ShadButton.outline(
                  onPressed: () => _showUnitInfo(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.info_outline, size: 16),
                      const SizedBox(width: 8),
                      Text(context.pvtroCommon.commonWebFeatures.help),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getUnitTypeName(String unitType) {
    switch (unitType) {
      case 'length':
        return 'Length / Distance';
      case 'weight':
        return 'Weight / Mass';
      case 'temperature':
        return 'Temperature';
      default:
        return unitType;
    }
  }

  void _performConversion() {
    final value = double.tryParse(_valueController.text);
    if (value == null || value <= 0) {
      setState(() {
        convertedValue = '';
      });
      return;
    }

    String result = '';
    switch (selectedUnit) {
      case 'length':
        result =
            '${value} meters = ${(value * 3.28084).toStringAsFixed(2)} feet';
        break;
      case 'weight':
        result = '${value} kg = ${(value * 2.20462).toStringAsFixed(2)} pounds';
        break;
      case 'temperature':
        result = '${value}°C = ${((value * 9 / 5) + 32).toStringAsFixed(2)}°F';
        break;
    }

    setState(() {
      convertedValue = result;
    });
  }

  void _showUnitInfo(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Unit Conversion Info'),
        description: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current unit type: ${_getUnitTypeName(selectedUnit)}'),
            const SizedBox(height: 12),
            const Text(
              'This demonstrates pvtro_conver package translations working alongside pvtro_common translations in the same UI.',
            ),
            const SizedBox(height: 12),
            const Text(
              'All translations are automatically coordinated when you change the language using the selector at the top.',
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

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }
}
