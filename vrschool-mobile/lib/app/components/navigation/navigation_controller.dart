import 'package:mobx/mobx.dart';
part 'navigation_controller.g.dart';

class NavigationController = NavigationControllerBase
    with _$NavigationController;

abstract class NavigationControllerBase with Store {
  @observable
  int selectedBottomBarIndex = 0;

  @action
  onItemTapped(int index) {
    if (selectedBottomBarIndex != index) {
      selectedBottomBarIndex = index;
    }
  }
}
