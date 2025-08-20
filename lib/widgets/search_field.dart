import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchField<T> extends StatefulWidget {
  final String hint;
  final Future<List<T>> Function(String query) onSearch;
  final String Function(T item) displayString;

  final void Function(List<T> selectedItems)? onSelected;
  final TextEditingController? controller;
  final bool isMultiSelect;
  final Object Function(T item)? itemKey;
  final Duration debounceDuration;

  // 🔹 Extra parameters from CustomSearchTextField
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final String? prefixText;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool enabled;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final InputBorder? border;
  final int? maxLength;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const SearchField({
    super.key,
    required this.hint,
    required this.onSearch,
    required this.displayString,
    this.onSelected,
    this.controller,
    this.isMultiSelect = false,
    this.itemKey,
    this.debounceDuration = const Duration(milliseconds: 300),

    // 🔹 New params
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.labelText,
    this.prefixText,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.enabled = true,
    this.style,
    this.inputFormatters,
    this.onChanged,
    this.onSubmit,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.border,
    this.maxLength,
    this.focusNode,
    this.contentPadding,
  });

  @override
  State<SearchField<T>> createState() => _SearchFieldState<T>();
}

class _SearchFieldState<T> extends State<SearchField<T>> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;
  List<T> _results = [];

  final List<T> _selectedItems = <T>[];
  final Set<Object> _selectedKeys = <Object>{};

  bool _isLoading = false;
  bool _isExternalController = false;
  bool _isExternalFocusNode = false;

  Timer? _debounce;

  Object _keyOf(T item) =>
      widget.itemKey != null ? widget.itemKey!(item) : widget.displayString(item);

  bool _isSelected(T item) => _selectedKeys.contains(_keyOf(item));

  Future<void> _search(String query) async {
    setState(() => _isLoading = true);
    final results = await widget.onSearch(query);
    if (!mounted) return;

    final filtered = results.where((e) => !_selectedKeys.contains(_keyOf(e))).toList();

    setState(() {
      _results = filtered;
      _isLoading = false;
    });
    _updateOverlay();
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(widget.debounceDuration, () => _search(query));
    widget.onChanged?.call(query);
  }

  @override
  void initState() {
    super.initState();

    _isExternalController = widget.controller != null;
    _controller = widget.controller ?? TextEditingController();

    _isExternalFocusNode = widget.focusNode != null;
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _search(_controller.text);
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    if (!_isExternalController) {
      _controller.dispose();
    }
    if (!_isExternalFocusNode) {
      _focusNode.dispose();
    }
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _updateOverlay() => _overlayEntry?.markNeedsBuild();

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleSelect(T item) {
    final key = _keyOf(item);
    if (widget.isMultiSelect) {
      if (_selectedKeys.contains(key)) {
        _removeByKey(key);
      } else {
        _selectedKeys.add(key);
        _selectedItems.add(item);
        widget.onSelected?.call(List.unmodifiable(_selectedItems));
        setState(() {});
      }
      _updateOverlay();
    } else {
      _selectedKeys
        ..clear()
        ..add(key);
      _selectedItems
        ..clear()
        ..add(item);
      _controller.text = widget.displayString(item);
      widget.onSelected?.call(List.unmodifiable(_selectedItems));
      _focusNode.unfocus(); // close overlay
    }
  }

  void _removeByKey(Object key) {
    _selectedKeys.remove(key);
    final idx = _selectedItems.indexWhere((e) => _keyOf(e) == key);
    if (idx != -1) _selectedItems.removeAt(idx);
    widget.onSelected?.call(List.unmodifiable(_selectedItems));
    setState(() {});
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              child: _isLoading
                  ? const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              )
                  : (_results.isEmpty
                  ? const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: Text("No results found")),
              )
                  : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final item = _results[index];
                  final selected = _isSelected(item);
                  return ListTile(
                    dense: true,
                    leading: widget.isMultiSelect
                        ? Checkbox(
                      value: selected,
                      onChanged: (_) => _toggleSelect(item),
                    )
                        : null,
                    title: Text(widget.displayString(item)),
                    onTap: () => _toggleSelect(item),
                  );
                },
              )),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final field = TextField(
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      style: widget.style,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ?? const Icon(Icons.search),
        prefix: widget.prefix,
        suffix: widget.suffix,
        prefixText: widget.prefixText,
        border: widget.border ?? const OutlineInputBorder(),
        contentPadding: widget.contentPadding,
        counterText: "", // hides maxLength counter
      ),
      onChanged: _onQueryChanged,
      onSubmitted: widget.onSubmit,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(link: _layerLink, child: field),

        // Chips for multi-select
        if (widget.isMultiSelect && _selectedItems.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _selectedItems.map((item) {
              final key = _keyOf(item);
              return Chip(
                label: Text(widget.displayString(item)),
                onDeleted: () => _removeByKey(key),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
