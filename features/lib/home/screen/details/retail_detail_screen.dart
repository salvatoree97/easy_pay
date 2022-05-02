import 'package:common/common.dart';
import 'package:flutter/material.dart';

class RetailDetailScreen extends StatelessWidget {
  final RetailModel retailModel;
  const RetailDetailScreen({
    Key? key,
    required this.retailModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStreachableHeaderScreen(
      title: retailModel.name,
      bodyWidget: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            const SizedBox(height: Dimension.pt10),
            TitleDescriptionWidget(
              title: S.of(context).retail_detail_name,
              description: retailModel.name,
            ),
            const SizedBox(height: Dimension.pt30),
            TitleDescriptionWidget(
              title: S.of(context).retail_detail_description,
              description: retailModel.description,
            ),
            const SizedBox(height: Dimension.pt30),
            TitleDescriptionWidget(
              title: S.of(context).retail_detail_address,
              description: retailModel.address ?? "-",
            ),
          ],
        ),
      ),
      defaultImage: Icons.shop_2_rounded,
      imageUrl: retailModel.imageUrl,
      heroTag: retailModel.id,
      showBlurOnImage: false,
      showBack: true,
      showClose: false,
      floatingWidget: Container(
        width: SizeHelper.screenWidth,
        height: 70,
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimension.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleDescriptionWidget(
                title: S.of(context).retail_detail_discount,
                description: retailModel.discountPercentageString,
                spacing: 0,
                titleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
                descriptionTextStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
              ),
              CustomElevatedButton(
                padding: EdgeInsets.zero,
                title: S.of(context).retail_detail_pay_button,
                onPressed: () {},
                width: SizeHelper.wp(50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
