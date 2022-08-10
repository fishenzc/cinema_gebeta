// ignore_for_file: prefer_const_constructors
// import 'package:flutter/cupertino.dart';
import 'package:cinema_g/widgets/basics/asset_player_widget.dart';
import 'package:flutter/material.dart';
import '../models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content?> contentList;
  final bool isOrginals;

  const ContentList(
      {Key? key,
      required this.title,
      required this.contentList,
      this.isOrginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentSheet paymentSheet;
    bool checkBoxValue = false;
    // ignore: dead_code
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        height: isOrginals ? 500.0 : 220.0,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index]!;
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      context: context,
                      builder: (context) => Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 30.0),
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Your Payment Information',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Form(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PaymentSheet(),
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Radio<int>(value: 1, groupValue: 0, onChanged: ),
                                        //   ],
                                        // ),
                                        Text(
                                          'Enter Your Phone Number',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            style:
                                                TextStyle(color: Colors.white),
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'Phone number cannot be empty';
                                              } else if (value.length < 3) {
                                                return 'phone nubmer must be at least 10 characters long.';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Phone Number',
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color: Colors.redAccent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color: Colors.redAccent),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              hoverColor: Colors.redAccent,
                                            ),
                                            cursorColor: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                        onPrimary: Colors.white,
                                        elevation: 20.0,
                                        shadowColor: Colors.amber,
                                        padding: const EdgeInsets.only(
                                            left: 140,
                                            right: 120,
                                            top: 20,
                                            bottom: 20.0),
                                      ),
                                      child: Text(
                                        'pay 20 birr',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.redAccent,
                                                ),
                                              );
                                            });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AssetPlayerWidget()),
                                        );
                                      }),
                                ]),
                          ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: isOrginals ? 400.0 : 200.0,
                  width: isOrginals ? 200.0 : 130.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(content.imageUrl),
                    fit: BoxFit.cover,
                  )),
                ),
              );
            }),
      )
    ]);
  }
}

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  int groupRadioValue = 0;
  int radioValue = 1;
  int radioValue2 = 2;
  bool checkBox2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        radioButton(),
        SizedBox(
          height: 20.0,
        ),
        checkBox(),
      ],
    );
  }

  Widget radioButton() {
    return Row(
      children: [
        Row(
          children: [
            Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Colors.redAccent),
                activeColor: Colors.redAccent,
                value: 1,
                groupValue: groupRadioValue,
                onChanged: (value) {
                  setState(() {
                    groupRadioValue = radioValue;
                  });
                }),
            Text(
              'Tele Birr',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Row(
          children: [
            Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => Colors.redAccent),
                activeColor: Colors.redAccent,
                value: 2,
                groupValue: groupRadioValue,
                onChanged: (value) {
                  setState(() {
                    groupRadioValue = radioValue2;
                  });
                }),
            Text(
              'CBE Birr',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }

  Widget checkBox() {
    return Row(
      children: [
        Checkbox(
            checkColor: Colors.black,
            activeColor: Colors.redAccent,
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.redAccent),
            value: checkBox2,
            onChanged: (value) {
              setState(() {
                checkBox2 = true;
              });
            }),
        Text(
          'Save this payment method for later',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
