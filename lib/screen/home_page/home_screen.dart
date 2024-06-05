import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:moboshop/common/buttons.dart';
import 'package:moboshop/common/dropdown.dart';
import 'package:moboshop/common/textStyle.dart';
import 'package:moboshop/common/textfields.dart';
import 'package:moboshop/data/database_api.dart';
import 'package:moboshop/data/database_class.dart';
import 'package:moboshop/screen/home_page/home_page.dart';
import 'package:moboshop/utils/colors.dart';
import 'package:moboshop/utils/string.dart';
import 'package:moboshop/widgets/ddlcontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerProductType = TextEditingController();
  TextEditingController controllerMobileNumber = TextEditingController();
  TextEditingController controllerCutomerEmail = TextEditingController();
  TextEditingController controllerProductModel = TextEditingController();
  TextEditingController controllerProductColor = TextEditingController();
  TextEditingController controllerProductSerialNumber = TextEditingController();
  TextEditingController controllerProductimieNumber = TextEditingController();
  TextEditingController controllerIssue = TextEditingController();
  TextEditingController controllerCustomerOrDealer = TextEditingController();
  TextEditingController controllerDealershopName = TextEditingController();
  TextEditingController controllerWarrentyStatus = TextEditingController();
  TextEditingController controllerCondition = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerEstimate = TextEditingController();
  String? selectProdcuttype;
  String? selectPaymenttype;
  GlobalKey<FormState> mobilekey = GlobalKey<FormState>();
  GlobalKey key = GlobalKey();

  DateTime selectedDate = DateTime.now();

  final df = new DateFormat('dd-MM-yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: mobilekey,
          child: Column(
            children: [
              //name
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtName,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) => val!.isEmpty ? 'Please Enter Name' : null,
                  keyboardType: TextInputType.name,
                  controller: controllerName,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter name'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //date
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtDate,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context).then((value) =>
                            controllerDate.text = df.format(selectedDate));
                      },
                      icon: Icon(Icons.calendar_month_outlined)),
                  validator: (val) => val!.isEmpty ? 'Please Enter Date' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerDate,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Date'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //producttype
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtProducttype,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textfieldContainer(
                    h: MediaQuery.of(context).size.height / 13.5,
                    w: MediaQuery.of(context).size.width * 0.90,
                    DropdownButtonHideUnderline(
                      child: dropdownButton(
                        hinttext: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(txtSelectProdType),
                        ),
                        value: selectProdcuttype,
                        isExpanded: false,
                        items: [
                          const DropdownMenuItem(
                              value: 'Iphone',
                              child: Center(child: Text(txtIphone))),
                          const DropdownMenuItem(
                              value: 'Ipad',
                              child: Center(child: Text(txtIpad))),
                          const DropdownMenuItem(
                              value: 'Mac', child: Center(child: Text(txtMac))),
                          const DropdownMenuItem(
                              value: 'Other',
                              child: Center(child: Text(txtOther))),
                        ],
                        onChanged: (val) {
                          setState(() {
                            selectProdcuttype = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtPaymenttype,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textfieldContainer(
                    h: MediaQuery.of(context).size.height / 13.5,
                    w: MediaQuery.of(context).size.width * 0.90,
                    DropdownButtonHideUnderline(
                      child: dropdownButton(
                        hinttext: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(txtSelectPayType),
                        ),
                        value: selectPaymenttype,
                        isExpanded: false,
                        items: [
                          const DropdownMenuItem(
                              value: 'Cash',
                              child: Center(child: Text(txtCash))),
                          const DropdownMenuItem(
                              value: 'Online',
                              child: Center(child: Text(txtOnline))),
                        ],
                        onChanged: (val) {
                          setState(() {
                            selectPaymenttype = val;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //customer mobile number
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtCustomerMono,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Mobile number' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerMobileNumber,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Mobile Number'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //customer email
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtEmail,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Email' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerCutomerEmail,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Email'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //product model
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtProductModel,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Product model' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerProductModel,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Product model'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //product color
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtProductColor,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Product Color' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerProductColor,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Product Color'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),

              //product serial number
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtProdSerialNumber,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) => val!.isEmpty
                      ? 'Please Enter Product serial number'
                      : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerProductSerialNumber,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Serial Number'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //product imie number
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtProdImieNumber,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter IMEI Number' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerProductimieNumber,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter IMEI Number'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),

              //warrenty status
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtPrice,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Price' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerPrice,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Price'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtEstimate,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Estimate status' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerEstimate,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Estimate'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //issue
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtIssue,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  maxLines: 5,
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Issue' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerIssue,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Issue'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //cudgomer dealer
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtCutsomer,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Dealer/customer Name' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerCustomerOrDealer,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Dealer/customer Name'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //delar shop name
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtDelarShopName,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Dealer Shop name' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerDealershopName,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: "Enter Dealer's shop Name"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //warrenty status
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtWarrentyStatus,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Warranty status' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerWarrentyStatus,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Warranty Status'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
              //condition
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.065,
                  ),
                  Text(
                    txtCondition,
                    style: textstyle(black, 18, FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0136,
              ),
              textFields(
                  maxLines: 5,
                  validator: (val) =>
                      val!.isEmpty ? 'Please Enter Condition' : null,
                  keyboardType: TextInputType.multiline,
                  controller: controllerCondition,
                  w: MediaQuery.of(context).size.width * 0.90,
                  hintText: 'Enter Condition'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),

              //product details
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  animatedButton(
                      h: MediaQuery.of(context).size.height / 14,
                      w: MediaQuery.of(context).size.width / 2,
                      text: txtSubmit,
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.CENTER_ROUNDER,
                      fontcolor: Colors.white,
                      fontsize: 16,
                      backgroundColor: Colors.cyan.shade900,
                      borderColor: Colors.white,
                      borderRadius: 50,
                      borderWidth: 2,
                      onPress: () async {
                        if (mobilekey.currentState!.validate()) {
                          Mobotech ur = Mobotech(
                              name: controllerName.text,
                              mob: controllerMobileNumber.text,
                              colour: controllerProductColor.text.toString(),
                              condition: controllerCondition.text.toString(),
                              customer:
                                  controllerCustomerOrDealer.text.toString(),
                              date: controllerDate.text.toString(),
                              email: controllerCutomerEmail.text.toString(),
                              imeiNum:
                                  controllerProductimieNumber.text.toString(),
                              issue: controllerIssue.text.toString(),
                              productModel:
                                  controllerProductModel.text.toString(),
                              productType: selectProdcuttype.toString(),
                              serialNumber:
                                  controllerProductSerialNumber.text.toString(),
                              shopname:
                                  controllerDealershopName.text.toString(),
                              warrenty:
                                  controllerWarrentyStatus.text.toString(),
                              estimate: controllerEstimate.text.toString(),
                              paymentType: selectPaymenttype.toString(),
                              price: controllerPrice.text.toString());
                          if (controllerName.text != "") {
                            await UserRegApi.addData(ur: ur)
                                .then((value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    )));
                            await UserRegApi.getData();
                          }
                          setState(() {
                            controllerName.clear();
                            controllerDate.clear();
                            controllerProductType.clear();
                            controllerMobileNumber.clear();
                            controllerCutomerEmail.clear();
                            controllerProductModel.clear();
                            controllerProductColor.clear();
                            controllerProductSerialNumber.clear();
                            controllerProductimieNumber.clear();
                            controllerIssue.clear();
                            controllerCustomerOrDealer.clear();
                            controllerDealershopName.clear();
                            controllerWarrentyStatus.clear();
                            controllerCondition.clear();
                            controllerEstimate.clear();
                            controllerPrice.clear();
                            selectPaymenttype = null;
                            selectProdcuttype = null;
                          });
                        }
                      }),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.027,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
