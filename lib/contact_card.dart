import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: Text(
                              'github',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Row(
                            children: [
                              Icon(Icons.link),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child: Text('https://github.com/SushmitaBhor',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline)),
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'https://github.com/SushmitaBhor'));
                                },
                              )
                            ],
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: Text(
                              'Location',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Navi Mumbai',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )
                        ]),
                    Row(children: [
                      SizedBox(
                        width: 80.w,
                        child: Text(
                          'mobile',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '9594315974',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 80.w,
                        child: Text(
                          'LinkedIn',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Row(
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'https://www.linkedin.com/in/sushmitabhor/'));
                            },
                            child: Text(
                              'https://www.linkedin.com/in/sushmitabhor/',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                              softWrap: true,
                            ),
                          ),
                        ],
                      )
                    ])
                  ],
                ),
              ),
            ),
          );
        } else {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 10.w,
                            child: Text(
                              'github',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Row(
                            children: [
                              Icon(Icons.link),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child: Text('https://github.com/SushmitaBhor',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    )),
                                onTap: () {
                                  launchUrl(Uri.parse(
                                      'https://github.com/SushmitaBhor'));
                                },
                              )
                            ],
                          )
                        ]),
                    Row(children: [
                      SizedBox(
                        width: 20.w,
                        child: Text(
                          'Location',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_pin),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Navi Mumbai',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 20.w,
                        child: Text(
                          'mobile',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '9594315974',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 20.w,
                        child: Text(
                          'portfolio',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 80.w,
                            child: GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://portfolio-30e80.web.app'));
                              },
                              child: Text(
                                'https://portfolio-30e80.web.app',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                    Row(children: [
                      SizedBox(
                        width: 20.w,
                        child: Text(
                          'LinkedIn',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 80.w,
                            child: GestureDetector(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/sushmitabhor/'));
                              },
                              child: Text(
                                'https://www.linkedin.com/in/sushmitabhor/',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      )
                    ])
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
