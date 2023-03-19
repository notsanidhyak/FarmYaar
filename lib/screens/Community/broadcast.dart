import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reckon_farmyaar/utils/utils.dart';
import 'package:http/http.dart' as http;

class BroadcastPage extends StatefulWidget {
  const BroadcastPage({Key? key}) : super(key: key);

  @override
  State<BroadcastPage> createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  var commData = [];
  TextEditingController text = TextEditingController();

  void getCommData() async {
    var url = Uri.parse('http://192.168.137.214:300/community/fetch');
    var response = await http.get(url);
    setState(() {
      commData = json.decode(response.body)['data'];
      print(commData);
    });
  }

  @override
  void initState() {
    getCommData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff151413),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: const Color(0xff2A2C28),
                    child: Container(
                      height: h(context) * 0.27,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 30),
                      child: TextField(
                        controller: text,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: 'Share your knowledge...',
                          hintStyle: TextStyle(
                            color: Color(0xffD9D9D9),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffD9D9D9), width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffD9D9D9), width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: h(context) * 0.20,
                    left: w(context) * 0.34,
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        var url = Uri.parse(
                            'http://192.168.137.214:300/community/add');
                        var response =
                            await http.post(url, body: {'data': text.text});
                        setState(() {
                          text.text = '';
                          getCommData();
                        });
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Broadcast',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: commData.length,
                  itemBuilder: (context, i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: const Color(0xff2A2C28),
                      child: Container(
                        height: h(context) * 0.27,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 30),
                        child: Text(
                          commData[i]['data'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
