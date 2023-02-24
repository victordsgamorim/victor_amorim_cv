import 'package:flutter/material.dart';
import 'package:victor_amorim_portifolio/core/theme/theme_colour.dart';
import 'package:victor_amorim_portifolio/ui/components/entities/dropdown_interface.dart';

class AndroidDropdown<T extends IDropdown> extends StatefulWidget {
  final List<T> items;
  final Function(T item)? onChanged;
  final Function(int index)? indexOf;
  final Widget Function(T item)? headBuilder;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final double width;
  final int initValue;

  const AndroidDropdown({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.headBuilder,
    this.onChanged,
    this.indexOf,
    this.width = 250,
    this.initValue = 0,
  })  : assert(items.length > 0),
        assert(initValue >= 0 || initValue < items.length);

  @override
  State<AndroidDropdown<T>> createState() => _AndroidDropdownState<T>();
}

class _AndroidDropdownState<T extends IDropdown>
    extends State<AndroidDropdown<T>> {
  int index = 0;
  late final GlobalKey _key;
  OverlayEntry? overlayEntry;
  late final ValueNotifier<int?> _colorController;
  late final ValueNotifier<T> _item;

  @override
  void initState() {
    super.initState();
    index = widget.initValue;
    _key = GlobalKey();
    _colorController = ValueNotifier<int?>(null);
    _item = ValueNotifier<T>(widget.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (overlayEntry != null) {
          overlayEntry?.remove();
          overlayEntry = null;
        } else {
          _showOverlay();
        }
      },
      child: ValueListenableBuilder(
          valueListenable: _item,
          builder: (_, item, __) {
            return Container(
              key: _key,
              child: widget.headBuilder != null
                  ? widget.headBuilder!(item)
                  : Row(
                      children: [
                        Text(item.value),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
            );
          }),
    );
  }

  void _showOverlay() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          _AndroidStudioDropdownTransparentArea(
            onTap: () {
              overlayEntry?.remove();
              overlayEntry = null;
            },
          ),
          Positioned(
            top: offset.dy + size.height,
            left: offset.dx,
            width: widget.width,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ThemeColour.primaryColor[800]!)),
              child: Material(
                elevation: 4.0,
                color: ThemeColour.primaryColor[500],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  itemBuilder: (_, index) {
                    final item = widget.items[index];
                    return GestureDetector(
                      onTap: () {
                        _setIndexOf(index);
                        _setOnChanged(item);
                        _item.value = item;
                        overlayEntry?.remove();
                        overlayEntry = null;
                      },
                      child: MouseRegion(
                        onEnter: (_) => _colorController.value = index,
                        onExit: (_) => _colorController.value = null,
                        child: ValueListenableBuilder(
                          valueListenable: _colorController,
                          child: widget.itemBuilder(context, item),
                          builder: (_, i, child) {
                            return Container(
                              decoration: BoxDecoration(
                                color: i == index
                                    ? Colors.blueAccent.withOpacity(.6)
                                    : Colors.transparent,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: child,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void _setOnChanged(item) =>
      widget.onChanged != null ? widget.onChanged!(item) : null;

  void _setIndexOf(int index) =>
      widget.indexOf != null ? widget.indexOf!(this.index = index) : null;
}

class _AndroidStudioDropdownTransparentArea extends StatelessWidget {
  final VoidCallback onTap;

  const _AndroidStudioDropdownTransparentArea({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: onTap,
      ),
    );
  }
}
