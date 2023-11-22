import 'package:flutter/material.dart';
import 'package:storezup/utils/color_themes.dart';

import '../model/event_model.dart';

class EventCard extends StatelessWidget {
  final EventModel eventModel;

  const EventCard({required this.eventModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              eventModel.shopImage,
              fit: BoxFit.cover,
              width: 100,
              height: double.infinity,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  eventModel.eventName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.store,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    eventModel.shopName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.description,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 170,
                    child: Text(
                      eventModel.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Expanded(flex: 1, child: Container()),
          Center(
            child: Container(
              height: 75,
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(eventModel.date.split(" ")[1]),
                  Text(
                    eventModel.date.split(" ")[0].substring(0, 3),
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
