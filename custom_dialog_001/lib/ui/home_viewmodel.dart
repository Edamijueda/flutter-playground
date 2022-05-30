import 'package:custom_dialog_001/app/app.locator.dart';
import 'package:custom_dialog_001/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();

  String userBio = 'No user bio. Tap custom Dialog to add';

  Future openCustomDialog() async{
    DialogResponse? response = await _dialogService.showCustomDialog(
      variant: DialogType.userProfile,
      title: 'Username: Edamijueda',
      imageUrl: 'lib/assets/sample_avatar.jpg',
    );
    if(response?.confirmed == true){
      userBio = response?.data[0];
      notifyListeners();
    }
  }
}