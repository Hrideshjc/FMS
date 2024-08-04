import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constant/app_enum.dart';
import '../utils/constant/constant.dart';
import '../utils/constant/text_directory.dart';
import 'language_state.dart';

class LanguageSelector extends StatefulWidget {
  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageState>(builder: (context, langProvider, _) {
      return Column(
        children: [
          Text(UIStrings.language,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (Constants.currentLang != Lang.ENG) {
                    langProvider.setLang(Lang.ENG);
                    //     AppPreference().setPreferredLanguage(Constants.currentLang);
                    //     Utilities.showInToast(MessagePrompts.LANGUAGE_SWITCHED);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 5),
                  child: Text("${UIStrings.english}"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Constants.currentLang != Lang.NP) {
                    langProvider.setLang(Lang.NP);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 5),
                  child: Text("${UIStrings.nepali}"),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
