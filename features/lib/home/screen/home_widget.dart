import 'package:common/common.dart';
import 'package:features/home/models/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  /// This holds the items
  final List<RetailModel> _items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.viewModel.retails != oldWidget.viewModel.retails &&
        oldWidget.viewModel.state.isLoading) {
      _addItems();
    }
  }

  void _addItems() async {
    for (RetailModel retail in widget.viewModel.filteredRetails) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        _items.add(retail);
        _listKey.currentState?.insertItem(
          widget.viewModel.retails.indexOf(retail),
          duration: const Duration(milliseconds: 100),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.state.isLoading) {
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.only(top: Dimension.pt10),
          itemCount: 3,
          separatorBuilder: (ctx, index) =>
              const SizedBox(height: Dimension.pt10),
          itemBuilder: (ctx, index) =>
              const IconTitleDescriptionSkeletonWidget(),
        ),
      );
    }

    if (widget.viewModel.state.error) {
      return Container(
        alignment: Alignment.center,
        child: const Text('C\'è stato un errore'),
      );
    }

    if (widget.viewModel.serchText?.isNotEmpty ?? false) {
      return Expanded(
        child: ListView.builder(
          itemCount: widget.viewModel.filteredRetails.length,
          itemBuilder: (ctx, index) => IconTitleDescriptionWidget(
            margin: const EdgeInsets.only(
              left: Dimension.defaultPadding,
              right: Dimension.defaultPadding,
              top: Dimension.defaultPadding,
            ),
            placeholderImage: '',
            imageSize: 80,
            title: widget.viewModel.filteredRetails[index].name,
            description: widget.viewModel.filteredRetails[index].description,
            badgeValue: widget
                .viewModel.filteredRetails[index].discountPercentageString,
            imageUrl: widget.viewModel.filteredRetails[index].imageUrl,
          ),
        ),
      );
    }

    return Expanded(
      child: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (ctx, index, animation) => FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: IconTitleDescriptionWidget(
            margin: const EdgeInsets.only(
              left: Dimension.defaultPadding,
              right: Dimension.defaultPadding,
              top: Dimension.defaultPadding,
            ),
            placeholderImage: '',
            imageSize: 80,
            title: _items[index].name,
            description: _items[index].description,
            badgeValue: _items[index].discountPercentageString,
            imageUrl: _items[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
