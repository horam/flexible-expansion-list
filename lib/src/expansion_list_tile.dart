import 'package:flutter/material.dart';

class ExpansionListTile extends StatefulWidget {
  /// creates an expandable list tile.
  const ExpansionListTile({
    Key? key,
    required this.isExpanded,
    required this.fixedItemBuilder,
    required this.expandableItemBuilder,
    required this.index,
    this.controller,
    this.animation,
  }) : super(key: key);

  /// A bool value to determine if the tile is expanded or not.
  final bool isExpanded;

  /// The widget that should be displayed both when the group
  /// is collapsed or expanded.
  final IndexedWidgetBuilder fixedItemBuilder;

  /// The widget(s) that should be displayed after the expansion.
  final IndexedWidgetBuilder expandableItemBuilder;

  /// The controller for the animation.
  final AnimationController? controller;

  /// An animation with a value of type `T`.
  final Animation<double>? animation;

  /// The list tile index;
  final int index;

  @override
  State<StatefulWidget> createState() => _ExpansionListTileState();
}

class _ExpansionListTileState extends State<ExpansionListTile>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isPopupOpn = false;
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    _controller = widget.controller ??
        AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: this,
        );

    _animation = widget.animation ??
        CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpansionListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isExpanded != widget.isExpanded) {
      setState(() => _isExpanded = widget.isExpanded);
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isClosed = _isExpanded && _controller.isDismissed;
    return Container(
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        children: <Widget>[
          _buildFixedWidget(widget.index),
          AnimatedBuilder(
            animation: _controller.view,
            builder: (BuildContext context, Widget? child) =>
                _buildExpandableData(widget.index),
            child: isClosed ? null : _buildExpandableData(widget.index),
          ),
        ],
      ),
    );
  }

  Widget _buildFixedWidget(int index) => InkWell(
        child: widget.fixedItemBuilder(context, index),
        onTap: () => _handleExpandablePart(),
      );

  Widget _buildExpandableData(int index) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topLeft,
        heightFactor: _animation.value,
        child: Transform(
          transform: Matrix4.diagonal3Values(1, _controller.value, 1),
          child: widget.expandableItemBuilder(context, index),
        ),
      ),
    );
  }

  void _handleExpandablePart() {
    if (_controller.status == AnimationStatus.completed ||
        _controller.status == AnimationStatus.dismissed) {
      setState(() => _isExpanded = !_isExpanded);
      _animate();
    }
  }

  void _animate() =>
      _isExpanded ? _controller.forward() : _controller.reverse();
}
