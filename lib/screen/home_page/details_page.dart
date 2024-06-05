import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moboshop/common/textStyle.dart';
import 'package:moboshop/data/database_class.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  const DetailsPage({super.key, required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("c7d8d9"),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan.shade900,
        title: Image.asset(
          "assets/images/mobotech1.png",
          height: 60,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/user.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].name!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/phone.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].mob!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/gmail.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].email!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/calendar.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].date!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/proType.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].productType!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/model.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].productModel!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/color.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].colour!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/serial.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].serialNumber!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/imei.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].imeiNum!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/customer.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].customer!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/store.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].shopname!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/warranty.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(userDataList[widget.index].warrenty!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/money.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("${userDataList[widget.index].price!}/-",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/calculator.png",
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("${userDataList[widget.index].estimate!}/-",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text.rich(
                  TextSpan(
                      text: 'Issue :- ',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      children: <InlineSpan>[
                        TextSpan(
                            text: userDataList[widget.index].issue!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal))
                      ]),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(10),
                // margin: EdgeInsets.only(),
                child: Text.rich(
                  TextSpan(
                      text: 'Condition :- ',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      children: <InlineSpan>[
                        TextSpan(
                            text: userDataList[widget.index].condition!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal))
                      ]),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
