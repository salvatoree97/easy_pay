import 'dart:math';
import 'package:common/common.dart';
import 'package:features/profile/screen/widget/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  late double _initialHeight;
  late double _expandedHeight;

  @override
  void initState() {
    super.initState();
    _initialHeight = SizeHelper.screenTopPadding + SizeHelper.hp(20);
    _expandedHeight = _initialHeight;
    _scrollController = ScrollController()..addListener(_scrollListner);
  }

  void _scrollListner() {
    setState(() {
      _expandedHeight =
          max(_initialHeight, _initialHeight - (2 * _scrollController.offset));
    });
  }

  void _onLogoutTapped() {
    PackageConfiguration.navigationService.push(
      AppRoutes.optionSheet,
      arguments: OptionBottomSheetParams(
        title: 'Logout',
        description:
            'Premendo conferma uscirai dall\'app e dovrai rieffettuare l\'access. Sei sicuro di voler continuare?',
        onConfirmTapped: _performLogout,
      ),
    );
  }

  void _performLogout() {
    FirebaseAuthService.instance.signOut();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      PackageConfiguration.navigationService.pushAndRemoveUntil(
        AppRoutes.initialScreen,
        (_) => false,
        arguments: true,
      );
    });
  }

  void _onPersonalDataTapped() {
    PackageConfiguration.navigationService.push(AppRoutes.personalDataScreen);
  }

  void _onThemeTapped() {
    PackageConfiguration.navigationService.push(AppRoutes.themeScreen);
  }

  void _onNotificationsTapped() {
    PackageConfiguration.navigationService.push(AppRoutes.notificationsScreen);
  }

  void _onSettingsTapped() {
    PackageConfiguration.navigationService.push(AppRoutes.settingsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      incudeTopSafeArea: false,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ProfileAppBar(
              expandedHeight: _expandedHeight,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: Dimension.defaultPadding),
                IconTitleDescriptionWidget(
                  title: 'Personal Data',
                  placeholderImage: Icons.person,
                  imageSize: 30,
                  imagePadding: const EdgeInsets.all(Dimension.defaultPadding),
                  imageColor: Theme.of(context).colorScheme.onSecondary,
                  showArrow: true,
                  onTap: _onPersonalDataTapped,
                ),
                const SizedBox(height: Dimension.defaultPadding),
                IconTitleDescriptionWidget(
                  title: 'Tema',
                  placeholderImage: Icons.color_lens_rounded,
                  imageSize: 30,
                  imagePadding: const EdgeInsets.all(Dimension.defaultPadding),
                  imageColor: Theme.of(context).colorScheme.onSecondary,
                  showArrow: true,
                  onTap: _onThemeTapped,
                ),
                const SizedBox(height: Dimension.defaultPadding),
                IconTitleDescriptionWidget(
                  title: 'Notifiche',
                  placeholderImage: Icons.notifications_rounded,
                  imageSize: 30,
                  imagePadding: const EdgeInsets.all(Dimension.defaultPadding),
                  imageColor: Theme.of(context).colorScheme.onSecondary,
                  showArrow: true,
                  onTap: _onNotificationsTapped,
                ),
                const SizedBox(height: Dimension.defaultPadding),
                IconTitleDescriptionWidget(
                  title: 'Impostazioni',
                  placeholderImage: Icons.settings_rounded,
                  imageSize: 30,
                  imagePadding: const EdgeInsets.all(Dimension.defaultPadding),
                  imageColor: Theme.of(context).colorScheme.onSecondary,
                  showArrow: true,
                  onTap: _onSettingsTapped,
                ),
                const SizedBox(height: Dimension.defaultPadding),
                TitleDescriptionButtonWidget(
                  title: 'Versione',
                  description: 'Num versione',
                  buttonTitle: 'Logout',
                  onTap: _onLogoutTapped,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  borderRadius: Dimension.pt10,
                  spacing: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimension.defaultPadding,
                    vertical: Dimension.pt8,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
