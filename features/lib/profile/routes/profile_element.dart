import 'package:common/common.dart';
import 'package:features/profile/routes/profile_navigator.dart';
import 'package:flutter/material.dart';

class ProfileElement extends TabBarElement {
  ProfileElement()
      : super(
          tabName: S.current.profile,
          icon: Icons.supervised_user_circle,
          index: 1,
          navigator: const ProfileNavigator(),
          controller: ScrollController(),
        );
}
