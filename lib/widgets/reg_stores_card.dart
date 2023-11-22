import 'package:flutter/material.dart';
import 'package:storezup/model/store_model.dart';
import 'package:storezup/utils/color_themes.dart';

import '../screens/store_detail_screen.dart';

class RegStoresCard extends StatelessWidget {
  final StoreModel storeModel;

  const RegStoresCard({required this.storeModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(storeModel: storeModel)));
      },
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                storeModel.imageLink,
                fit: BoxFit.cover,
                width: 100,
                height: double.infinity,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeModel.shopName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.greyColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      storeModel.address,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 190,
                  child: Text(
                    storeModel.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Container(
              // height: 50,
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "View",
                    style: TextStyle(color: AppColors.primaryLightColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
