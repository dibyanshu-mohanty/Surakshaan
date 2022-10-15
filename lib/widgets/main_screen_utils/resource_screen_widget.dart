import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safety_app/services/url_opener.dart';
import 'package:sizer/sizer.dart';

class ResourceTile extends StatelessWidget {
  final String title;
  final String type;
  final String url;
  ResourceTile(
      {Key? key, required this.title, required this.type, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2223338), Color(0xFF372238)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(type == "Video" ? 0 : 20.0),
          bottomLeft: Radius.circular(type == "Blog" ? 0 : 20.0),
        ),
      ),
      child: ListTile(
        leading: type == "Video"
            ? FaIcon(
                FontAwesomeIcons.youtube,
                color: Color(0xFFf88786),
              )
            : FaIcon(
                FontAwesomeIcons.bloggerB,
                color: Color(0xFFffa8a1),
              ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 14.0),
          softWrap: true,
        ),
        trailing: type == "Video"
            ? IconButton(
                onPressed: () {
                  UrlHelper().openURL(url);
                },
                icon: FaIcon(
                  FontAwesomeIcons.play,
                  color: Color(0xFF273dd6),
                ))
            : IconButton(
                onPressed: () {
                  UrlHelper().openURL(url);
                },
                icon: FaIcon(
                  FontAwesomeIcons.readme,
                  color: Color(0xFF273dd6),
                )),
      ),
    );
  }
}
