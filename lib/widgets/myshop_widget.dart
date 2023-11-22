import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:storezup/resources/cloudfirestore_methods.dart';
import 'package:storezup/utils/color_themes.dart';

import '../model/store_model.dart';
import '../utils/utils.dart';
import 'package:intl/intl.dart';

class MyShopWidget extends StatefulWidget {
  final StoreModel storeModel;
  const MyShopWidget({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

  @override
  State<MyShopWidget> createState() => _MyShopWidgetState();
}

class _MyShopWidgetState extends State<MyShopWidget> {
  Expanded spaceThingy = Expanded(child: Container());

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    TextEditingController dateInput = TextEditingController();
    TextEditingController eventNameController = TextEditingController();
    TextEditingController eventDescController = TextEditingController();
    TextEditingController offerTitleController = TextEditingController();
    TextEditingController offerDescController = TextEditingController();
    TextEditingController announcementController = TextEditingController();
    TextEditingController announcementDescController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          spaceBetweenChildren: 10,
          backgroundColor: AppColors.primaryColor,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.event_rounded),
              label: "Add Event",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.primaryLightColor,
                      scrollable: true,
                      title: const Text("Add Event"),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextField(
                                controller: dateInput,
                                //editing controller of this TextField
                                decoration: const InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "Enter Date" //label text of field
                                    ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat.MMMMd().format(pickedDate);
                                    //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateInput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                              ),
                              TextFormField(
                                controller: eventNameController,
                                decoration: const InputDecoration(
                                  labelText: "Event Name",
                                  icon: Icon(Icons.account_box),
                                ),
                              ),
                              TextFormField(
                                controller: eventDescController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  icon: Icon(Icons.message),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text(
                            "Create Event",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            CloudFirestoreClass().uploadEvent(
                              date: dateInput.text,
                              eventName: eventNameController.text,
                              description: eventDescController.text,
                              shopImage: widget.storeModel.imageLink,
                              shopName: widget.storeModel.shopName,
                              shopLocation: widget.storeModel.address,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.percent),
              label: "Add Offers",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.primaryLightColor,
                      scrollable: true,
                      title: const Text("Add Offers"),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: offerTitleController,
                                decoration: const InputDecoration(
                                  labelText: "OFFER",
                                  icon: Icon(Icons.percent),
                                ),
                              ),
                              TextFormField(
                                controller: offerDescController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  icon: Icon(Icons.description),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text(
                            "Create Offer",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            CloudFirestoreClass().uploadOffer(
                                offerTitle: offerTitleController.text,
                                description: offerDescController.text,
                                shopName: widget.storeModel.shopName);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.announcement),
              label: "Add Announcement",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.primaryLightColor,
                      scrollable: true,
                      title: const Text("Add Event"),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: announcementController,
                                decoration: const InputDecoration(
                                  labelText: "Announcement",
                                  icon: Icon(Icons.announcement),
                                ),
                              ),
                              TextFormField(
                                controller: announcementDescController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                  icon: Icon(Icons.description),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text(
                            "Add Announcement",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            CloudFirestoreClass().uploadAnnouncement(
                                announcement: announcementController.text,
                                description: announcementDescController.text,
                                shopName: widget.storeModel.shopName);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 3,
                    child: Container(
                      color: AppColors.primaryColor,
                      child: Image.network(
                        widget.storeModel.imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.storeModel.shopName,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.storeModel.address,
                          style: const TextStyle(color: Color(0xFFBFBFBF)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Container(
                  height: 0.7,
                  width: double.infinity,
                  color: const Color(0xFFBFBFBF),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.description),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: 365,
                          child: Text(
                            widget.storeModel.description,
                            // softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.contact_page),
                            Text(
                              "Contact",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.storeModel.contact,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              maximumSize: const Size(220, 150)),
                          child: const Row(
                            children: [
                              Text(
                                "Edit Store Details",
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 16),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.edit,
                                color: AppColors.whiteColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
