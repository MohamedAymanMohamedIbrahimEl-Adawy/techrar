import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../services/localization/app_localization.dart';
import '../../services/theme/app_colors.dart';

class MyCustomDropDown extends StatefulWidget {
  final TextEditingController? controller;
  final List<String> options;
  final String? initialValue;
  final String? label;
  final String? dropdownLabel;
  final String? hintText;
  final bool? isOptional;
  final bool enableSearch;
  final bool enableFilter;
  final double? width;
  final double? height;
  final bool isEnabled;
  final ValueChanged<dynamic>? onChange;
  final FocusNode? focusNode;
  final bool translateLabel;
  const MyCustomDropDown({
    super.key,
    this.controller,
    required this.options,
    this.enableFilter = false,
    this.initialValue,
    this.dropdownLabel,
    this.hintText,
    this.onChange,
    this.label,
    this.width,
    this.isEnabled = true,
    this.height,
    this.isOptional = false,
    this.enableSearch = false,
    this.focusNode,
    this.translateLabel = false,
  });

  @override
  State<MyCustomDropDown> createState() => _MyCustomDropDownState();
}

class _MyCustomDropDownState extends State<MyCustomDropDown> {
  late final TextEditingController _controller;

  final List<String> options = [];
  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    options.addAll(widget.options);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null
            ? const SizedBox.shrink()
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  Text(
                    widget.label ?? '',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(),
                  ),
                  !widget.isOptional!
                      ? Text(
                        ' *',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.alertColor,
                        ),
                      )
                      : const SizedBox.shrink(),
                  const SizedBox(width: 10),
                  widget.isOptional!
                      ? Text(
                        "(${"optional"})",
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(),
                      )
                      : Container(),
                ],
              ),
            ),
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (event) {
            FocusScope.of(context).unfocus();
          },
          child: DropdownMenu(
            requestFocusOnTap: widget.enableSearch,
            focusNode: widget.focusNode,
            enabled: widget.isEnabled,
            label:
                widget.dropdownLabel != null
                    ? Text(
                      widget.dropdownLabel!.tr(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.contentColor,
                      ),
                    )
                    : const SizedBox.shrink(),
            width: widget.width ?? 180,
            menuHeight: 300, //Add Fixed height
            controller: _controller,
            onSelected: (value) {
              if (widget.onChange != null) {
                widget.onChange!(value);
              }
              setState(() {});
            },
            enableFilter: widget.enableFilter,
            enableSearch: widget.enableSearch,
            initialSelection: _controller.text,
            textStyle: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(fontSize: 12),
            trailingIcon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: AppColors.contentColor,
            ),

            leadingIcon: null, // const Icon(Icons.search),
            selectedTrailingIcon: const Icon(
              Icons.keyboard_arrow_up_outlined,
              size: 20,
              color: AppColors.contentColor,
            ),
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.white,
              ), // Menu background color
              elevation: WidgetStateProperty.all(8), // Shadow effect
              surfaceTintColor: WidgetStateProperty.all(
                AppColors.hintTextColor,
              ), // Background tint
              // shape: WidgetStateProperty.all(
              //   const RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(8),
              //     ), // Rounded only on top

              //     side: BorderSide(
              //       color: Colors.blue,
              //       width: 1,
              //     ),
              //   ),
              // ),
              alignment:
                  AppLocalization.isArabic
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft, // Align menu items
            ),
            // hintText: widget.hintText? ?? 'select',
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              constraints: BoxConstraints.tight(
                Size.fromHeight(widget.height ?? 44),
              ),
              hintStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: AppColors.contentColor),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            // inputDecorationTheme: const InputDecorationTheme(
            //   filled: true,
            //   contentPadding: EdgeInsets.symmetric(vertical: 5.0),
            // ),
            dropdownMenuEntries: List.generate(
              options.length,
              (index) => DropdownMenuEntry(
                value: options[index],
                label:
                    widget.translateLabel
                        ? options[index].tr()
                        : options[index],
                // leadingIcon: Icon(
                //   Icons.check,
                //   color: AppColors.primaryColor,
                // ),
                trailingIcon:
                    options[index] == _controller.text
                        ? const Icon(
                          Icons.check,
                          color: AppColors.primaryColor,
                          size: 18,
                        )
                        : null,

                style: MenuItemButton.styleFrom(
                  // foregroundColor: AppColors.primaryColor50,
                  // padding: EdgeInsets.only(left: 1),
                  foregroundColor:
                      options[index] == _controller.text
                          ? AppColors.primaryColor
                          : AppColors.contentColor,
                  alignment: Alignment.center,
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight:
                        options[index] == _controller.text
                            ? FontWeight.w600
                            : FontWeight.w400,
                    color:
                        options[index] == _controller.text
                            ? AppColors.primaryColor
                            : AppColors.contentColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
