import 'package:flutter/material.dart';
import 'package:storezup/model/store_model.dart';
import 'package:storezup/screens/store_detail_screen.dart';

import '../utils/color_themes.dart';

class PopStoresCard extends StatelessWidget {
  final StoreModel storeModel;

  const PopStoresCard({required this.storeModel, Key? key}) : super(key: key);

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
        width: 250,
        height: 270,
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: Stack(
          children: [
            _buildCardImage(),
            _buildCardDesc(),
          ],
        ),
      ),
    );
  }

  _buildCardImage() => Container(
        width: 250,
        height: 220,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.network(
                storeModel.imageLink,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 50,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  _buildCardDesc() => Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeModel.shopName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Image.asset('assets/images/ic_location.png', width: 14),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.greyColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        storeModel.address,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyTextColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.route,
                    size: 18,
                    color: AppColors.primaryColor,
                  ))
            ],
          ),
        ),
      );
}
