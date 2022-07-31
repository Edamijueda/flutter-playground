import 'package:flutter/material.dart';
import 'package:playground/ui/search_in_listview/components.dart';
import 'package:playground/ui/search_in_listview/viewmodel.dart';
import 'package:stacked/stacked.dart';

SearchInListViewModel _viewModel = SearchInListViewModel();

class SearchInListView extends StatelessWidget {
  const SearchInListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final styleActive = TextStyle(color: Colors.black);
    //final styleHint = TextStyle(color: Colors.black54);
    //final style = _viewModel.query.isEmpty ? styleHint : styleActive;
    return ViewModelBuilder<SearchInListViewModel>.reactive(
      disposeViewModel: false,
      // Tells the viewModelBuilder that we only want to initialise the SVM once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => SearchInListViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Filter & Search ListView'),
          centerTitle: true,
        ),
        body: buildPage(model.currentIndex, model),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.upload_file),
              label: 'Offline',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.online_prediction),
              label: 'Online',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(int currentIndex, SearchInListViewModel model) {
    switch (currentIndex) {
      case 0:
        return buildColumn(model, model.searchOfflineBook);
      case 1:
        return buildColumn(model, model.searchOnlineBook);
      default:
        return const SizedBox.shrink();
    }
  }

  Column buildColumn(
    SearchInListViewModel model,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      children: <Widget>[
        SearchWidget(
          text: model.query,
          hintText: 'Title or Author Name',
          onChanged: onChanged,
        ),
        Expanded(
          child: (model.isBusy)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: model.books.length,
                  itemBuilder: (context, index) {
                    final book = model.books[index];
                    return ListTile(
                      leading: Image.network(
                        book.urlImage,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
