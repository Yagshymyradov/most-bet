import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/field_text.dart';
import '../../../data/auth_model.dart';
import '../../../l10n/l10n.dart';
import '../../../provider.dart';
import '../../../utils/extensions.dart';

class NameAgeField extends StatefulWidget {
  final AuthModel authModel;
  final VoidCallback onNextButtonTap;

  const NameAgeField({
    super.key,
    required this.onNextButtonTap,
    required this.authModel,
  });

  @override
  State<NameAgeField> createState() => _NameAgeFieldState();
}

class _NameAgeFieldState extends State<NameAgeField> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void whenTapNextButton() {
    widget.authModel.name = nameController.text;
    widget.authModel.age = ageController.text;

    widget.onNextButtonTap();
  }

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  @override
  void initState() {
    initialValue();
    super.initState();
  }

  void initialValue() {
    final scope = ProviderScope.containerOf(context, listen: false);
    final auth = scope.read(authControllerProvider);
    if (auth?.name != null) {
      nameController.text = auth!.name!;
    }
    if (auth?.age != null) {
      ageController.text = auth!.age!;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 134),
          Text(
            l10n.letsCreteProfile,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          Text(
            l10n.addYourNameAge,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          FieldText(
            hintText: l10n.name,
            controller: nameController,
            onChanged: (val) {
              updateUi();
              return null;
            },
          ),
          const SizedBox(height: 16),
          FieldText(
            hintText: l10n.age,
            controller: ageController,
            onChanged: (val) {
              updateUi();
              return null;
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: whenTapNextButton,
            child: Text(
              l10n.next,
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
