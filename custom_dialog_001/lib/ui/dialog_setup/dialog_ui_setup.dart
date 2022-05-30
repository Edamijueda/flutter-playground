import 'package:custom_dialog_001/app/app.locator.dart';
import 'package:custom_dialog_001/enums/dialog_type.dart';
import 'package:custom_dialog_001/ui/dialog_setup/custom_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

// This method is called in main.dart
void setupDialogUI() {
  final DialogService dialogService = locator<DialogService>();
  final builders = {
    DialogType.userProfile: (BuildContext context, DialogRequest dialogRequest,
        Function(DialogResponse) dialogResponse) =>
        CustomDialogView(request: dialogRequest, onDialogTap: dialogResponse),
    // You can add other custom dialog type  to this map
  };
  dialogService.registerCustomDialogBuilders(builders);
}