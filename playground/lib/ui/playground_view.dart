import 'package:flutter/material.dart';
import 'package:playground/ui/playground_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PlaygroundView extends StatefulWidget {
  const PlaygroundView({Key? key}) : super(key: key);

  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaygroundViewModel>.reactive(
      viewModelBuilder: () => PlaygroundViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Playground Exercises'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  model.openCustomDialog();
                },
                child: const Text('Custom Dialog'),
              ),
              (model.userBio != null)
                  ? Text(model.userBio!,
                      style: const TextStyle(color: Colors.grey))
                  : const SizedBox.shrink(),
              ElevatedButton(
                onPressed: () {
                  model.goToFilterListviewScreen();
                },
                child: const Text('Search in ListView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
