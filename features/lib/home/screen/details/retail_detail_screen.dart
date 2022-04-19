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
            Text(retailModel.name),
          ],
        ),
      ),
      defaultImage: '',
      imageUrl: retailModel.imageUrl,
      heroTag: retailModel.id,
      showBlurOnImage: false,
      showBack: true,
      showClose: false,
    );
  }
}
