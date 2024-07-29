import 'package:flutter/widgets.dart';
import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';

class AppItems {
  static listRowItems({
    required String title,
    required bool loading,
    required List<dynamic> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.title(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        loading
            ? AppLoading.appLoadingScaffold()
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) {
                  return Row(
                    children: [
                      Image.network(
                        items[i].thumbnail,
                        width: 50,
                        height: 50,
                      ),
                      Text(items[i].title)
                    ],
                  );
                }),
      ],
    );
  }
}
