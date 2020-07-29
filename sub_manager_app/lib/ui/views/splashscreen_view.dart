import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:sub_manager_app/app/app_theme.dart';
import 'package:sub_manager_app/app/dynamic_size.dart';
import 'package:sub_manager_app/ui/viewmodels/splashscreen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    DynamicSize().init(context);
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder.reactive(
        builder: (context, viewModel, child) => Scaffold(
              body: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SvgPicture.asset(
                        viewModel.logoPath,
                        width: 200 * DynamicSize.widthFactor,
                        height: 200 * DynamicSize.widthFactor,
                        color: AppTheme.accentColor,
                      ),
                    ),
                    SizedBox(
                      height: 10 * DynamicSize.heightFactor,
                    ),
                    Text(viewModel.title,
                        style:
                            AppTheme.h1.copyWith(color: AppTheme.accentColor)),
                    SizedBox(
                      height: 40 * DynamicSize.heightFactor,
                    ),
                    CircularProgressIndicator(
                      backgroundColor:
                          AppTheme.accentColor, //Change the indicator color
                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme
                          .backgroundColor), //Change the background color
                    )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => SplashScreenViewModel());
  }
}
