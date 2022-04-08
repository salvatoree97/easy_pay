import 'package:common/common.dart';
import 'package:easy_pay/app/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeHelper.init(MediaQuery.of(context));

    void _onError() {
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        NavigationService.instance.pushAndReplace(AppRoutes.initialScreen);
      });
    }

    void _onEmailNotConfirmed() {
      NavigationService.instance
          .pushAndReplace(AppRoutes.registrationThirdStepScreen);
    }

    void _onSuccess() {
      NavigationService.instance.pushAndReplace(AppRoutes.tabScreen);
    }

    return StoreConnector<AppState, UserState>(
      onInit: (store) => store.dispatch(
        fetchUserThunk(
          onError: _onError,
          onEmailNotConfirmed: _onEmailNotConfirmed,
          onSuccess: _onSuccess,
        ),
      ),
      converter: (store) => store.state.userState,
      builder: (_, vm) => Container(),
    );
  }
}
