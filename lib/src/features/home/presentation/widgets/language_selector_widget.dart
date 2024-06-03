import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

const supporttedCountries = [
  Country.tr,
  Country.us,
  Country.de,
  Country.fr,
  Country.es,
  Country.it,
  Country.pt,
  Country.ru,
  Country.jp,
];

class LanguageSelectorWidget extends StatefulWidget {
  final Function(Country? country)? onLanguageSelected;
  final bool enabled;

  /// A widget that allows the user to [select a language] to speak and transcribe
  ///
  ///
  const LanguageSelectorWidget({
    super.key,
    this.onLanguageSelected,
    this.enabled = true,
  });

  @override
  State<LanguageSelectorWidget> createState() => _LanguageSelectorWidgetState();
}

class _LanguageSelectorWidgetState extends State<LanguageSelectorWidget> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled
          ? () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: const Text('Auto Detect'),
                          onTap: () {
                            setState(() {
                              _selectedCountry = null;
                            });

                            widget.onLanguageSelected?.call(null);
                            Navigator.pop(context);
                          },
                        ),
                        for (final country in supporttedCountries)
                          ListTile(
                            leading: CountryFlag(
                              country: country,
                              height: 20,
                            ),
                            title:
                                Text(context.locLanguageFromCountry(country)),
                            onTap: () {
                              setState(() {
                                _selectedCountry = country;
                              });

                              widget.onLanguageSelected?.call(country);
                              context.pop();
                            },
                          ),
                      ],
                    ),
                  );
                },
              );
            }
          : null,
      child: Card.filled(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
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
                      ? Text(
                          context.loc.selectSpeechLanguage,
                          style: context.textTheme.titleSmall,
                        )
                      : Text(context.locLanguageFromCountry(_selectedCountry!),
                          style: context.textTheme.titleMedium),
                  const Gap(10),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              Visibility(
                visible: _selectedCountry == null,
                child: Text(
                  context.loc.optiponalLanguageInfo,
                  style: context.textTheme.labelSmall!.copyWith(
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
