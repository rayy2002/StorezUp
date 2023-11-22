import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storezup/model/event_model.dart';
import 'package:storezup/utils/color_themes.dart';
import 'package:storezup/widgets/event_card_widget.dart';

import '../widgets/search_bar_widget.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: SearchBarWidget(
          label: "Explore Events",
          searchfor: "events",
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("events").snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else if (snapshot.data!.size == 0) {
                  return const Center(
                    child: Text("No upcoming events yet"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      EventModel model = EventModel.getModelFromJson(
                          json: snapshot.data!.docs[index].data());
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: EventCard(eventModel: model),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
