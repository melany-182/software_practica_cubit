class ItemsState {
  final List<String>? items;
  String? selectedItem;

  ItemsState(this.items, this.selectedItem);

  copyWith({List<String>? items, String? selectedItem}) {
    return ItemsState(items ?? this.items, selectedItem ?? this.selectedItem);
  }
}
