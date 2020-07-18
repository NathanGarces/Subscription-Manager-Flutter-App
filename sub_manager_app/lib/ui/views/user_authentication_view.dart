import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:sub_manager_app/ui/viewmodels/user_authentication_viewmodel.dart';

class UserAuthenticationView extends StatelessWidget {
  const UserAuthenticationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.black,
              body: Center(),
            ),
        viewModelBuilder: () => UserAuthenticationViewModel());
  }
}
