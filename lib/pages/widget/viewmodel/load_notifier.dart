
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    // TODO: implement build
    return true;
  }

  void loading(){
    state = false;
  }

  void loaded(){
    state = true;
  }
}

final loadNotifier = NotifierProvider.autoDispose<LoadNotifier, bool>(() => LoadNotifier());

