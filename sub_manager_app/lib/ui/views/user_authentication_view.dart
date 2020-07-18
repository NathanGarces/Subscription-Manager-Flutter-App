import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:sub_manager_app/app/app_theme.dart';
import 'package:sub_manager_app/app/dynamic_size.dart';
import 'package:sub_manager_app/ui/viewmodels/user_authentication_viewmodel.dart';
import 'package:sub_manager_app/widgets/auth_header_bar.dart';

class UserAuthenticationView extends StatelessWidget {
  const UserAuthenticationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    DynamicSize().init(context);

    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: AppTheme.secondaryColor,
              body: Container(
                width: DynamicSize.deviceWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [AuthHeader()],
                ),
              ),
            ),
        viewModelBuilder: () => UserAuthenticationViewModel());
  }
}
