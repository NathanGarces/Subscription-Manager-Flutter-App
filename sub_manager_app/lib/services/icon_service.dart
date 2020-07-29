import 'package:injectable/injectable.dart';

@lazySingleton
class IconService {
  String imageUri(ProjectIcon icontype) {
    switch (icontype) {
      case ProjectIcon.logo:
        return 'assets\\images\\logo.svg';
        break;
      case ProjectIcon.no_subs:
        return 'assets\\images\\no_subs.svg';
        break;
      case ProjectIcon.menu:
        return 'assets\\images\\menu.svg';
        break;
      case ProjectIcon.add:
        return 'assets\\images\\add.svg';
        break;
      case ProjectIcon.search:
        return 'assets\\images\\search.svg';
        break;
      default:
        return '';
        break;
    }
  }
}

enum ProjectIcon {
  logo,
  no_subs,
  menu,
  add,
  search,
}
