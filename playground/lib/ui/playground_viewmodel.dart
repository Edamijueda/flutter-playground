import 'package:playground/app/app.locator.dart';
import 'package:playground/core/enums/dialog_type.dart';
import 'package:playground/ui/search_in_listview/view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PlaygroundViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navService = locator<NavigationService>();

  String? _userBio;
  String? get userBio => _userBio; // 001_custom Dialog

  Future openCustomDialog() async {
    // 001_custom Dialog
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.userProfile,
      title: 'Username: Edamijueda',
      imageUrl: 'lib/assets/sample_avatar.jpg',
    );
    if (response?.confirmed == true) {
      _userBio = response?.data[0];
      notifyListeners();
    }
  }

  void goToFilterListviewScreen() {
    _navService.navigateToView(const SearchInListView());
  }
}
