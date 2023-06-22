import '../constant/app_constants.dart';

class PagingController<T> {
  List<T> listItems = [];
  int pageNumber = AppConstants.defaultPageNumber;
  bool isLoadingPage = false;
  bool endOfList = false;

  void initRefresh() {
    listItems = [];
    pageNumber = AppConstants.defaultPageNumber;
    isLoadingPage = false;
    endOfList = false;
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !endOfList;
  }

  void appendPage(List<T> items) {
    listItems.addAll(items);
    pageNumber++;
  }

  void appendLastPage(List<T> items) {
    listItems.addAll(items);
    endOfList = true;
  }
}
