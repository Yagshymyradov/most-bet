import 'package:flutter/material.dart';

import '../../../components/field_text.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class NameAgeField extends StatefulWidget {
  final VoidCallback onNextButtonTap;

  const NameAgeField({super.key, required this.onNextButtonTap});

  @override
  State<NameAgeField> createState() => _NameAgeFieldState();
}

class _NameAgeFieldState extends State<NameAgeField> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final fieldsIsNotEmpty = nameController.text.isNotEmpty && ageController.text.isNotEmpty;
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 134),
          Text(
            'Let’s create your profile!',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          Text(
            'Add your name and your age',
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          FieldText(
            hintText: 'Name',
            controller: nameController,
            onChanged: (val) {
              updateUi();
              return null;
            },
          ),
          const SizedBox(height: 16),
          FieldText(
            hintText: 'age',
            controller: ageController,
            onChanged: (val) {
              updateUi();
              return null;
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: fieldsIsNotEmpty ? widget.onNextButtonTap : null,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                fieldsIsNotEmpty ? null : AppColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Text(
              'Next',
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
