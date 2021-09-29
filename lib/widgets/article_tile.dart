import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatefulWidget {
  final String imgUrl, title, source, postUrl;
  const ArticleTile(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.source,
      required this.postUrl})
      : super(key: key);
  @override
  _ArticleTileState createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  Future<void>? _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.postUrl != null) {
          _launched = _launchInBrowser(widget.postUrl);
        } else {
          return;
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              height: 200,
              child: Image.network(
                widget.imgUrl,
                width: MediaQuery.of(context).size.width - 25,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.source,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
