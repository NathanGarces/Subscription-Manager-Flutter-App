import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
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
    var focusNodeEmail = useFocusNode();
    var focusNodePassword = useFocusNode();
    var focusNodeConfirmPassword = useFocusNode();

    return Container(
      width: 380 * DynamicSize.widthFactor,
      height: (viewModel.authenticationType == AuthenticationType.signup)
          ? 420 * DynamicSize.heightFactor
          : 315 * DynamicSize.heightFactor,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AuthInputField(
                title: viewModel.emailTitle,
                controller: emailController,
                updateFieldVar: viewModel.setEnteredEmail,
                errorText: viewModel.emailError,
                focusNode: null,
                isFirstField: true,
                isLastField: false,
                onFieldSubmitted: (_) {
                  focusNodeEmail.unfocus();
                  FocusScope.of(context).requestFocus(focusNodePassword);
                },
              ),
              SizedBox(
                height: 20 * DynamicSize.heightFactor,
              ),
              _AuthInputField(
                title: viewModel.passwordTitle,
                controller: passwordController,
                updateFieldVar: viewModel.setEnteredPassword,
                errorText: viewModel.passwordError,
                focusNode: focusNodePassword,
                isFirstField: false,
                isLastField:
                    (viewModel.authenticationType == AuthenticationType.signup)
                        ? false
                        : true,
                onFieldSubmitted: (_) {
                  focusNodePassword.unfocus();
                  if (viewModel.authenticationType ==
                      AuthenticationType.signup) {
                    FocusScope.of(context)
                        .requestFocus(focusNodeConfirmPassword);
                  } else {
                    focusNodePassword.unfocus();
                    viewModel.submitAuthRequest();
                  }
                },
              ),
              if (viewModel.authenticationType == AuthenticationType.signup)
                SizedBox(
                  height: 20 * DynamicSize.heightFactor,
                ),
              if (viewModel.authenticationType == AuthenticationType.signup)
                _AuthInputField(
                  title: viewModel.confirmPasswordTitle,
                  controller: confirmPasswordController,
                  updateFieldVar: viewModel.setEnteredConfirmPassword,
                  errorText: viewModel.confirmPasswordError,
                  focusNode: focusNodeConfirmPassword,
                  isFirstField: false,
                  isLastField: true,
                  onFieldSubmitted: (_) {
                    focusNodeConfirmPassword.unfocus();
                    viewModel.submitAuthRequest();
                  },
                ),
              SizedBox(
                height: 20 * DynamicSize.heightFactor,
              ),
              _AuthConfirmButton()
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
  final Function updateFieldVar;
  final String errorText;
  final bool isFirstField;
  final bool isLastField;
  final FocusNode focusNode;
  final Function onFieldSubmitted;

  _AuthInputField(
      {@required this.title,
      @required this.controller,
      @required this.errorText,
      @required this.updateFieldVar,
      @required this.isFirstField,
      @required this.isLastField,
      @required this.focusNode,
      @required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    DynamicSize().init(context);

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
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction:
                  (isLastField) ? TextInputAction.done : TextInputAction.go,
              onChanged: updateFieldVar(controller.value.text),
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

class _AuthConfirmButton extends ViewModelWidget<UserAuthenticationViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    //Runtime Variables
    DynamicSize().init(context);
    var text = (viewModel.authenticationType == AuthenticationType.signup)
        ? viewModel.signup
        : viewModel.signin;

    return Container(
      width: 320 * DynamicSize.widthFactor,
      height: 44 * DynamicSize.heightFactor,
      child: FlatButton(
        color: AppTheme.accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        onPressed: viewModel.submitAuthRequest,
        child: Text(
          text,
          style: AppTheme.h2,
        ),
      ),
    );
  }
}
