import 'package:flutter/material.dart';
import 'package:playground/ui/custom_dialog/custom_dialog_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomDialogView extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) onDialogTap;

  const CustomDialogView({
    Key? key,
    required this.request,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  State<CustomDialogView> createState() => _CustomDialogViewState();
}

class _CustomDialogViewState extends State<CustomDialogView> {
  late final TextEditingController controller;

  final String errorMsg = 'Can\'t be null';
  bool isNotValid = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomDialogViewModel>.reactive(
      viewModelBuilder: () => CustomDialogViewModel(),
      builder: (context, model, child) => Dialog(
        backgroundColor: Colors.grey,
        child: SizedBox(
          width: 305.0,
          height: 470.0,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      widget.request.imageUrl ??
                          'lib/assets/my_profile_pics.jpg',
                    ),
                    width: 150.0,
                  ),
                  Text(widget.request.title ?? 'Trial'),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: TextField(
                      controller: controller,
                      textInputAction: TextInputAction.newline,
                      maxLength: 150,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: false,
                        hintText: 'Enter bio',
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0),
                        ),
                        errorText: isNotValid ? errorMsg : null,
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red.shade700, width: 1.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: TextButton(
                              onPressed: () => widget.onDialogTap(
                                DialogResponse(confirmed: false),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white60),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 28.0,
                            width: 90.0,
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.text.isEmpty) {
                                  setState(() {
                                    isNotValid = true;
                                  });
                                } else {
                                  widget.onDialogTap(
                                    DialogResponse(
                                      confirmed: true,
                                      data: [controller.text],
                                    ),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
