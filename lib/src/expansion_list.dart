import 'package:flutter/material.dart';

import 'package:flexible_expansion_list/flexible_expansion_list.dart';

typedef IndexedHeaderWidgetBuilder = Widget Function(
    BuildContext context, int index, bool isExpanded);

class FlexibleExpansionList<T> extends StatefulWidget {
  /// Create an expansion Header that can be used to control expansion list
  const FlexibleExpansionList({
    Key? key,
    required this.itemCount,
    required this.expandedItemBuilder,
    required this.fixedItemBuilder,
    this.headerBuilder,
    this.animation,
    this.controller,
  }) : super(key: key);

  /// number of main items of the list that are fixed.
  final int itemCount;

  /// Creates The widget that should be shown as the header for the whole list.
  final IndexedHeaderWidgetBuilder? headerBuilder;

  /// Creates widgets that should be displayed both when the group
  /// is collapsed or expanded.
  final IndexedWidgetBuilder fixedItemBuilder;

  /// The widget(s) that should be displayed after the expansion.
  final IndexedWidgetBuilder expandedItemBuilder;

  /// The controller for the animation.
  final AnimationController? controller;

  /// Expansion and collapse animation with a value of type double.
  final Animation<double>? animation;

  @override
  State<StatefulWidget> createState() => _FlexibleExpansionListState();
}

class _FlexibleExpansionListState extends State<FlexibleExpansionList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0 && widget.headerBuilder != null) {
                  return _buildTitle(context, index);
                }
                return ExpansionListTile(
                  expandableItemBuilder: widget.expandedItemBuilder,
                  fixedItemBuilder: widget.fixedItemBuilder,
                  isExpanded: _isExpanded,
                  index: index,
                  controller: widget.controller,
                  animation: widget.animation,
                );
              },
              childCount: widget.itemCount,
            ),
          )
        ],
      );

  Widget _buildTitle(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() => _isExpanded = !_isExpanded);
      },
      child: widget.headerBuilder!(context, index, _isExpanded),
    );
  }
}
