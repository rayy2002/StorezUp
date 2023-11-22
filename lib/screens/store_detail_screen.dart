import 'package:flutter/material.dart';
import 'package:storezup/model/store_model.dart';

import '../utils/color_themes.dart';

class DetailPage extends StatefulWidget {
  final StoreModel storeModel;

  const DetailPage({Key? key, required this.storeModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  children: [
                    _buildAppBar(context),
                    const SizedBox(height: 24),
                    _buildCardImage(widget.storeModel),
                    const SizedBox(height: 16),
                    _buildDescription(widget.storeModel),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomBar(context, widget.storeModel),
          )
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, StoreModel storeModel) =>
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
          decoration: const BoxDecoration(color: AppColors.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(210, 100),
                    primary: AppColors.whiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    maximumSize: const Size(400, 150)),
                child: const Text(
                  "Contact ",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                ),
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
                    maximumSize: const Size(200, 150)),
                child: const Text(
                  "Subscribe",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildCardImage(StoreModel storeModel) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16)),
          ),
          Container(
            width: double.infinity,
            height: 310,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  storeModel.imageLink,
                ),
              ),
            ),
          ),
          Positioned(
            right: 22,
            top: 22,
            child: Container(
              height: 65,
              width: 48,
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
      );

  Widget _buildAppBar(BuildContext context) => Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          const Text(
            "Store Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Container()
        ],
      );

  _buildDescription(StoreModel storeModel) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeModel.shopName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppColors.greyColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          storeModel.address,
                          style:
                              const TextStyle(color: AppColors.greyTextColor),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 65,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    storeModel.category,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // const StackParticipant(
            //   fontSize: 14,
            //   width: 30,
            //   height: 30,
            //   positionText: 100,
            // ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: storeModel.description,
                style: const TextStyle(
                  color: AppColors.greyTextColor,
                  fontSize: 12,
                  height: 1.75,
                ),
                children: const [
                  TextSpan(
                    text: "  Read More...",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      );
}
