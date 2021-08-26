import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final title;
  final desc;
  final url;

  const PageViewItem({key, this.title, this.desc, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(flex: 2,),
          Image.asset(
            url,
            height: 50,
            width: 50,
          ),
          Spacer(),
          Text(
            desc,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
