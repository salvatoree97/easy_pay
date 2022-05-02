import 'package:common/common.dart';
import 'package:features/home/models/home_view_model.dart';
import 'package:features/home/screen/home/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: DefaultAppBar(
        title: S.of(context).home,
        barStyle: AppBarStyle.textLeft,
      ),
      body: StoreConnector<AppState, HomeViewModel>(
        converter: (store) => HomeViewModel.fromStore(store),
        onInit: (store) => store.dispatch(fetchRetailsThunk()),
        builder: (ctx, viewModel) =>
            ChangeNotifierProvider<HomeViewModel>.value(
          value: viewModel,
          builder: (context, _) => Column(
            children: [
              CustomFormTextField(
                placeholder: S.of(context).search_placeholder,
                value: viewModel.serchText ?? '',
                isEnabled: !viewModel.state.isLoading && !viewModel.state.error,
                onChanged: viewModel.updateSearchText,
                margin: const EdgeInsets.symmetric(
                    horizontal: Dimension.defaultPadding),
              ),
              HomeWidget(viewModel: Provider.of<HomeViewModel>(context)),
            ],
          ),
        ),
      ),
    );
  }
}
