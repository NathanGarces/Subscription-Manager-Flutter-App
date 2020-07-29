import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

//View Model Import
import 'package:sub_manager_app/ui/viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              body: Center(
                child: FlatButton(
                  child: Text("Sign Out"),
                  onPressed: viewModel.logout,
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
