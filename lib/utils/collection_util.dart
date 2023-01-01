
extension ListExtension<E> on List<E?>? {

  List<E> removeNulls() {
    final notNull = <E>[];
    if (this != null) {
      for (var element in this!) {
        if (element != null) {
          notNull.add(element);
        }
      }
    }
    return notNull;
  }

}