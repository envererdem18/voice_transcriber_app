import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

const supporttedCountries = [
  Country.tr,
  Country.us,
];

/// A widget that allows the user to [select a language] to speak and transcribe
class LanguageSelectorWidget extends StatefulWidget {
  final Function(Country country)? onLanguageSelected;
  const LanguageSelectorWidget({
    super.key,
    this.onLanguageSelected,
  });

  @override
  State<LanguageSelectorWidget> createState() => _LanguageSelectorWidgetState();
}

class _LanguageSelectorWidgetState extends State<LanguageSelectorWidget> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return ListView(
              children: [
                const Gap(16),
                for (final country in supporttedCountries)
                  ListTile(
                    leading: CountryFlag(
                      country: country,
                      height: 20,
                    ),
                    title: Text(context.locLanguageFromCountry(country)),
                    onTap: () {
                      setState(() {
                        _selectedCountry = country;
                      });
                      widget.onLanguageSelected?.call(country);
                      Navigator.pop(context);
                    },
                  ),
              ],
            );
          },
        );
      },
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _selectedCountry == null
                  ? const Icon(Icons.language_outlined)
                  : CountryFlag(
                      country: _selectedCountry!,
                      height: 20,
                    ),
              const Gap(10),
              _selectedCountry == null
                  ? Text(context.loc.pleaseSelectLanguage,
                      style: context.textTheme.titleSmall)
                  : Text(context.locLanguageFromCountry(_selectedCountry!),
                      style: context.textTheme.titleMedium),
              const Gap(10),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
