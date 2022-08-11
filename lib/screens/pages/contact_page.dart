import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:andrea_stee/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:andrea_stee/responsive.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          color: Colors.white,
          constraints: BoxConstraints(minWidth: size.width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isMobile(context) ? 50 : 80),
              Text(
                'contact.',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.normal,
                  fontSize: isMobile(context) ? 60 : 85,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: isMobile(context) ? 25 : 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SocialButton(
                    url: behanceURL,
                    iconColor: Color(0xFF053EFF),
                    iconData: FontAwesomeIcons.behance,
                  ),
                  SizedBox(width: 50),
                  SocialButton(
                    url: instagramURL,
                    iconColor: Color(0xFFE1306C),
                    iconData: FontAwesomeIcons.instagram,
                  ),
                  SizedBox(width: 50),
                  SocialButton(
                    url: pinterestURL,
                    iconColor: Color(0xFFE60023),
                    iconData: FontAwesomeIcons.pinterest,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launch("mailto: ${emailID}?"),
                  child: const Text(
                    emailID,
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isMobile(context) ? 60 : 100),
            ],
          ),
        ),
        Container(
          color: Colors.black,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u00a9 2023 by Hardik. Crafted with ',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchLink(flutterURL),
                    child: const Text(
                      'Flutter.',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> launchLink(String url) async {
  await launchUrl(
    Uri.parse(url),
    webOnlyWindowName: '_blank',
  );
}

class SocialButton extends StatefulWidget {
  const SocialButton(
      {required this.url, required this.iconColor, required this.iconData});
  final String url;
  final Color iconColor;
  final IconData iconData;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    bool isHovering = false;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchLink(widget.url),
        child: Icon(
          widget.iconData,
          size: 40,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
