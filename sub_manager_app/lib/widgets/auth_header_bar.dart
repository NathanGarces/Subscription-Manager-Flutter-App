import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:sub_manager_app/app/app_theme.dart';
import 'package:sub_manager_app/app/dynamic_size.dart';
import 'package:sub_manager_app/ui/viewmodels/user_authentication_viewmodel.dart';

class AuthHeader extends ViewModelWidget<UserAuthenticationViewModel> {
  const AuthHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, UserAuthenticationViewModel viewModel) {
    //Runtime Variables
    DynamicSize().init(context);

    return Container(
      height: 300 * DynamicSize.heightFactor,
      width: DynamicSize.deviceWidth,
      decoration: BoxDecoration(gradient: AppTheme.gradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25 * DynamicSize.heightFactor),
          //Text(viewModel.title, style: AppTheme.h1), Leaving the title out for now because it seems awkward.
          SizedBox(height: 8 * DynamicSize.heightFactor),
          SvgPicture.asset(
            viewModel.logoPath,
            width: 120 * DynamicSize.widthFactor,
            height: 120 * DynamicSize.heightFactor,
          ),
          SizedBox(
            height: 10 * DynamicSize.heightFactor,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AuthChoiceButton(
                  type: AuthenticationType.signup,
                ),
                SizedBox(
                  width: 10 * DynamicSize.widthFactor,
                ),
                _AuthChoiceButton(
                  type: AuthenticationType.signin,
                )
              ])
        ],
      ),
    );
  }
}

class _AuthChoiceButton extends ViewModelWidget<UserAuthenticationViewModel> {
  final AuthenticationType type;

  _AuthChoiceButton({this.type});

  @override
  Widget build(BuildContext context, viewModel) {
    return (type == viewModel.authenticationType)
        ? MaterialButton(
            onPressed: () => viewModel.setAuthenticationType(type),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (type == AuthenticationType.signup)
                      ? viewModel.signup
                      : viewModel.signin,
                  style: AppTheme.h2,
                ),
                SizedBox(
                  height: 5 * DynamicSize.heightFactor,
                ),
                Container(
                  width: 100 * DynamicSize.widthFactor,
                  height: 4 * DynamicSize.heightFactor,
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                )
              ],
            ),
          )
        : MaterialButton(
            onPressed: () => viewModel.setAuthenticationType(type),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (type == AuthenticationType.signup)
                      ? viewModel.signup
                      : viewModel.signin,
                  style: AppTheme.h2,
                ),
                SizedBox(
                  height: 9 * DynamicSize.heightFactor,
                  width: 100 * DynamicSize.widthFactor,
                )
              ],
            ),
          );
  }
}
