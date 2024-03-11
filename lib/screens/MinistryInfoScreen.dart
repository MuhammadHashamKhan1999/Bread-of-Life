import 'package:carousel_slider/carousel_slider.dart';
import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/http/responses/MinistryInfoResponse.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class MinistryInfoScreen extends StatefulWidget {
  MinistryInfoScreen({Key? key,this.id}) : super(key: key);
  static const routeName = "/ministryInfoScreen";
  String? id = '';

  @override
  _MinistryInfoScreenState createState() => _MinistryInfoScreenState();
}

class _MinistryInfoScreenState extends State<MinistryInfoScreen> {

  int _current = 0;

  Future<MinistryInfoResponse>? mResponse;
  List<Result>? items = [];

  @override
  void initState() {
    super.initState();
    mResponse = _fetchMinistryInfoAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.ministry_info),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: mResponse,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (mResponse != null && items != null && items!.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(height:550, initialPage: 0, enlargeCenterPage: true, enableInfiniteScroll: false, scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason){
                        setState(() {
                          _current = index;
                        });
                      }),
                      items: items!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                      height: 550,
                                      width: MediaQuery.of(context).size.width,
                                      child: Stack(
                                        children: [
                                          Image.network(ApiUrl.BASEURL+ i.image!, fit: BoxFit.cover, height: 550,),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(color:Colors.black26,child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Text(i.name!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                                            ), width: MediaQuery.of(context).size.width,),
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ),
                              onTap: ()=> _openMinistryInfoScreen(i),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: items!.map((url) {
                        int index = items!.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Container(
                    child: Text(
                      t.no_data,
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  ),
                );
              }
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // open screen
  void _openMinistryInfoScreen(Result item){
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (BuildContext context) => SingleMinistryInfoScreen(item: item)));
  }

  // API method
  Future<MinistryInfoResponse> _fetchMinistryInfoAPI() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(Uri.parse(ApiUrl.MINISTRY_INFO + widget.id!), headers: headers);
    final ministryInfoResponse = ministryInfoResponseFromJson(response.body);
    if (ministryInfoResponse.status == 'ok') {
      setState(() {
        items = ministryInfoResponse.result;
      });
    } else {
      setState(() {
        items = null;
      });
    }
    return ministryInfoResponse;
  }

}