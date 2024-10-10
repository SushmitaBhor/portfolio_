import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(
                  text:
                      '\u2022 I\u0027m currently looking for opportunity for ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: 'Flutter developer position',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text:
                      '\u2022 I\u0027ve designed and developed high-quality applications using',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: ' Flutter',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: 'Proficiency in Mobile architecture',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve collaborated and',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text:
                      ' communiated with designer, project manager and other stakeholders',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '\u2022 I\u0027ve ability to',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                TextSpan(
                  text: ' participate in planning, reviewing, coding',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ])),
        ],
      ),
    );
  }
}
