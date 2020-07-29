import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:sub_manager_app/app/app_theme.dart';
import 'package:sub_manager_app/app/dynamic_size.dart';
import 'package:sub_manager_app/ui/viewmodels/user_authentication_viewmodel.dart';
import 'package:sub_manager_app/widgets/auth_form.dart';
import 'package:sub_manager_app/widgets/auth_header_bar.dart';

class UserAuthenticationView extends HookWidget {
  const UserAuthenticationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var size = MediaQuery.of(context).size;
    DynamicSize().init(context);
    bool isKeyboardVisible = (MediaQuery.of(context).viewInsets.bottom >= 150);

    //Used to animate the form upwards when the keyboad is visible and downwards when not.
    double formTopPosition = (isKeyboardVisible)
        ? 80 * DynamicSize.heightFactor
        : 230 * DynamicSize.heightFactor;

    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: AppTheme.backgroundColor,
              resizeToAvoidBottomInset: false,
              body: Container(
                width: DynamicSize.deviceWidth,
                height: DynamicSize.deviceHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(top: 0, child: AuthHeader()),
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        left: 15 * DynamicSize.widthFactor,
                        right: 15 * DynamicSize.widthFactor,
                        top: formTopPosition,
                        child: AuthForm()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Terms and conditions apply.",
                        style: AppTheme.p2,
                      ),
                    ),
                    if (viewModel.isBusy)
                      Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.black.withOpacity(0.3),
                        child: Center(
                          child: SizedBox(
                            height: 50 * DynamicSize.widthFactor,
                            width: 50 * DynamicSize.widthFactor,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(AppTheme
                                  .accentColor), //Change the progress indicators color.
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => UserAuthenticationViewModel());
  }
}
