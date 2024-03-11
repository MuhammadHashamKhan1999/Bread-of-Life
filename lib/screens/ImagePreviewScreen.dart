import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatefulWidget {
  ImagePreviewScreen({Key? key, this.img}) : super(key: key);
  static const routeName = "/imagePreviewScreen";
  String? img;

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.photo),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
       body: Container(
         decoration: new BoxDecoration(
           color: Colors.black87,
           image: new DecorationImage(
             image:NetworkImage(widget.img!),
           ),
         ),
       ),
    );
  }

}