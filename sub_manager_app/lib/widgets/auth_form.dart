import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:sub_manager_app/app/app_theme.dart';
import 'package:sub_manager_app/app/dynamic_size.dart';
import 'package:sub_manager_app/ui/viewmodels/user_authentication_viewmodel.dart';

class AuthForm extends HookViewModelWidget<UserAuthenticationViewModel> {
  AuthForm({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
      BuildContext context, UserAuthenticationViewModel viewModel) {
    //Runtime Variables
    DynamicSize().init(context);

    //TextInputControllers
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    var confirmPasswordController = useTextEditingController();

    return Container(
      width: 380 * DynamicSize.widthFactor,
      height: (viewModel.authenticationType == AuthenticationType.signup)
          ? 420 * DynamicSize.heightFactor
          : 330 * DynamicSize.heightFactor,
      decoration: BoxDecoration(
          color: AppTheme.backgroundConstrastColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 0),
              color: AppTheme.shadowColor,
            )
          ]),
      child: Form(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30 * DynamicSize.heightFactor,
              ),
              _AuthInputField(
                  title: viewModel.emailTitle,
                  controller: emailController,
                  errorText: viewModel.emailError),
              SizedBox(
                height: 20 * DynamicSize.heightFactor,
              ),
              _AuthInputField(
                title: viewModel.passwordTitle,
                controller: passwordController,
                errorText: viewModel.passwordError,
              ),
              SizedBox(
                height: 20 * DynamicSize.heightFactor,
              ),
              if (viewModel.authenticationType == AuthenticationType.signup)
                _AuthInputField(
                  title: viewModel.confirmPasswordTitle,
                  controller: confirmPasswordController,
                  errorText: viewModel.confirmPasswordError,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthInputField extends StatelessWidget {
  //Class States
  final String title;
  final TextEditingController controller;
  final String errorText;

  _AuthInputField(
      {@required this.title,
      @required this.controller,
      @required this.errorText});

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    DynamicSize().init(context);
    var temp = AppTheme.p2;

    return Container(
      width: 320 * DynamicSize.widthFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 2),
            child: Text(
              this.title,
              style: AppTheme.p1,
            ),
          ),
          Container(
            height: 40 * DynamicSize.heightFactor,
            child: TextFormField(
              controller: this.controller,
              cursorColor: AppTheme.secondaryColor,
              maxLines: 1,
              style: AppTheme.p1.copyWith(fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  helperMaxLines: 1,
                  focusColor: AppTheme.secondaryColor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)))),
            ),
          ),
          (errorText.isEmpty)
              ? SizedBox(
                  height: 18,
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 4, left: 2),
                  child: Text(
                    this.errorText,
                    style: AppTheme.p2.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      ),
    );
  }
}
