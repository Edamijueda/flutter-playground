// This class StackedApp takes in a list of route which uses d same route dart d
// auto_route package has defined, with slight name changes.
/// Writing to this file(app.dart) and running:
/// flutter pub run build_runner build --delete-conflicting-outputs
/// will auto-generate app.locator.dart and app.router.dart for you
import 'package:playground/ui/playground_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: PlaygroundView,
      initial: true,
    ),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: DialogService,
    ),
  ],
)
class AppSetUp {
  // Serves no purpose at the moment besides having an annotation attached

}
