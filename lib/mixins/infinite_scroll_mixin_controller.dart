import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marvel/models/rx_list.dart';
import 'package:marvel/services/logger.dart';
import '../services/debounce_time.dart';

mixin InfiniteScrollMixinController<T> on GetxController {
  ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final Rx<String> _searchText = "".obs;
  final Rx<int> _lastPage = 0.obs;
  final RxListObject<T> itemsList = RxListObject<T>([]);
  final Rx<bool> _fetching = false.obs;
  DebounceTime? debounceTime;

  @override
  void onInit() async {
    if (shouldFetchOnInit) {
      await list(0);
    }

    super.onInit();
  }

  @override
  void onReady() {
    if (enableSearch) {
      debounceTime = DebounceTime<String>(
        const Duration(milliseconds: 600),
        (String value) {
          searchText = value;
        },
      );
    }

    if (enableInfiniteScroll) {
      scrollListen();
    }

    super.onReady();
  }

  @override
  void onClose() {
    removeScrollListener();
    if (debounceTime != null) {
      debounceTime!.cancel();
    }
    super.onClose();
  }

  int get limit => 100;

  int get lastPage => _lastPage.value;

  bool get enableSearch => true;

  bool get enableInfiniteScroll => true;

  bool get shouldFetchOnInit => true;

  bool shouldAppend(List<T> entries) =>
      (entries.isNotEmpty && items.length >= limit);

  set lastPage(int value) {
    _lastPage.value = value;
    _lastPage.refresh();
  }

  List<T> get items => itemsList.value;

  set items(List<T> value) {
    itemsList.value = value;
    itemsList.refresh();
  }

  bool get fetching => _fetching.value;

  set fetching(bool value) {
    _fetching.value = value;
    _fetching.refresh();
  }

  static InfiniteScrollMixinController get instance =>
      Get.find<InfiniteScrollMixinController>();

  String get searchText => _searchText.value;

  set searchText(String value) {
    _searchText.value = value;
    _searchText.refresh();
    onRefresh();
  }

  void doSearch(String text) {
    if (debounceTime != null) {
      debounceTime!.cancel();
      if (text.isNotEmpty) {
        debounceTime!.value = text.replaceAll(RegExp(r'/\s+/g'), "");
      } else {
        searchText = '';
      }
    }
  }

  void scrollListen() {
    try {
      scrollController.addListener(
        () async {
          if (scrollController.position.maxScrollExtent ==
              scrollController.offset) {
            fetching = true;
            lastPage += 1;
            _lastPage.refresh();
            await list(items.length);
            fetching = false;
          }
        },
      );
    } catch (e) {
      Logger.info(e);
    }
  }

  void removeScrollListener() {
    try {
      scrollController.removeListener(scrollListen);
    } catch (e) {
      Logger.info(e);
    }
  }

  void renewScrollListener() {
    try {
      removeScrollListener();
      scrollListen();
    } catch (e) {
      Logger.info(e);
    }
  }

  Future<void> onRefresh() async {
    lastPage = 0;
    await list(lastPage);
  }

  Future<void> refect() async {
    await list(items.length);
  }

  Future<void> updateItems(int offset, List<T> items) async {
    if (shouldAppend(items) && offset > 0) {
      itemsList.append(items);
    } else {
      if (items.isNotEmpty) {
        itemsList.renew(items);
      }
    }
    itemsList.refresh();
  }

  void clearSearchText() {
    try {
      textEditingController.clear();
      searchText = '';
    } catch (e) {
      Logger.info(e);
    }
  }

  void updateItem(T item) => itemsList.updateItem(item);

  Future<void> list(
    int offset,
  ) async {}
}
