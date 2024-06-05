import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moboshop/common/textfields.dart';
import 'package:moboshop/data/database_api.dart';
import 'package:moboshop/data/database_class.dart';
import 'package:moboshop/screen/home_page/details_page.dart';
import 'package:moboshop/screen/home_page/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Mobotech> mobotechData = [];
  List<Mobotech> dummyMember = [];
  TextEditingController searchController = TextEditingController();

  bool isload = false;

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  void runFilter(String query) {
    List<Map> results = [];

    if (query.isEmpty) {
      results = mobotechData.cast<Map>();
    } else {
      results = mobotechData
          .where((userRegApi) => userRegApi.mob
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList()
          .cast<Map>();
    }
    dummyMember = results.cast<Mobotech>();
    setState(() {});
  }

  Future<void> getData() async {
    setState(() {
      isload = true;
    });
    mobotechData = await UserRegApi.getData();
    setState(() {
      isload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("c7d8d9"),
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: Colors.cyan.shade900,
        title: Image.asset(
          "assets/images/mobotech1.png",
          height: 60,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            icon: const Icon(
              Icons.edit_note,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            textFields(
                onChanged: (value) => runFilter(value),
                keyboardType: TextInputType.number,
                controller: searchController,
                w: MediaQuery.of(context).size.width * 0.95,
                hintText: 'Search Contact Information',
                suffixIcon: Icon(Icons.search)),
            Container(
                //color: Colors.green,
                height: 700,
                child: isload
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.cyan.shade900,
                        ),
                      )
                    : dummyMember.isNotEmpty
                        ? ListView.builder(
                            itemCount: dummyMember.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(index: index),
                                    ));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/user.png",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(dummyMember[index].name!),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text('For delete'),
                                                content: Text(
                                                    'Are you sure to Delete?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: (() {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      }),
                                                      child: Text("Ok")),
                                                  TextButton(
                                                      onPressed: (() {
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      }),
                                                      child: Text("Cancel"))
                                                ],
                                              ),
                                            ).then((value) async {
                                              if (value != null &&
                                                  value == true) {
                                                await UserRegApi.deleteData(
                                                    key: dummyMember[index]
                                                        .key!);
                                                dummyMember.removeAt(index);
                                                setState(() {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ));
                                                });
                                              }
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/phone.png",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(dummyMember[index].mob!)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/calendar.png",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(dummyMember[index].date!)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/smartphone.png",
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(dummyMember[index].imeiNum!)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : dummyMember.isEmpty
                            ? ListView.builder(
                                itemCount: mobotechData.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPage(index: index),
                                        ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/user.png",
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(mobotechData[index].name!),
                                            Spacer(),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text('For delete'),
                                                    content: Text(
                                                        'Are you sure to Delete?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: (() {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true);
                                                          }),
                                                          child: Text("Ok")),
                                                      TextButton(
                                                          onPressed: (() {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                          }),
                                                          child: Text("Cancel"))
                                                    ],
                                                  ),
                                                ).then((value) async {
                                                  if (value != null &&
                                                      value == true) {
                                                    await UserRegApi.deleteData(
                                                        key: mobotechData[index]
                                                            .key!);
                                                    mobotechData
                                                        .removeAt(index);
                                                    setState(() {});
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/phone.png",
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(mobotechData[index].mob!)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/calendar.png",
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(mobotechData[index].date!)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/smartphone.png",
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(mobotechData[index].imeiNum!)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : null),
          ],
        ),
      ),
    );
  }
}
