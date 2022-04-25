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
              title: 'Attività commerciale',
              description: retailModel.name,
            ),
            const SizedBox(height: Dimension.pt30),
            TitleDescriptionWidget(
              title: 'Descrizione',
              description: retailModel.description,
            ),
            const SizedBox(height: Dimension.pt30),
            TitleDescriptionWidget(
              title: 'Indirizzo',
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
                title: 'Sconto',
                description: retailModel.discountPercentageString,
                spacing: 0,
                titleTextStyle: Theme.of(context).textTheme.bodySmall,
                descriptionTextStyle: Theme.of(context).textTheme.titleLarge,
              ),
              CustomElevatedButton(
                padding: EdgeInsets.zero,
                title: 'Paga',
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
