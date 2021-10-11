import 'package:flutter/material.dart';
import 'package:movie_app/widgets/title_text.dart';

import 'more_show_cases_text.dart';

class TitleTextWithMoreShowCases extends StatelessWidget {
  final String titleText;
  final String moreShowCases;
  final bool moreShowCasesVisility;

  TitleTextWithMoreShowCases (this.titleText,this.moreShowCases,{this.moreShowCasesVisility=true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(titleText),
        Spacer(),
        MoreShowCases(moreShowCases),
      ],
    );
  }
}
