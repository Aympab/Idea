import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';


class MultiSelectWidget extends StatefulWidget {
  String titleMultiSelect;
  String textFieldName;
  String textFieldValue;
  List objectList;
  List selectedvalues;
  final Function(List selectedvalues) notifyParent;
  MultiSelectWidget({@required this.notifyParent, this.titleMultiSelect, this.textFieldName, this.textFieldValue, this.objectList, this.selectedvalues});
  
  @override
  _MultiSelectWidgetState createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiSelect(
          titleText: widget.titleMultiSelect,
          dataSource: widget.objectList,
          textField: widget.textFieldName,
          valueField: widget.textFieldValue,
          filterable: true,
          value: null,
          change: (values) {
            widget.selectedvalues = values;
            widget.notifyParent(widget.selectedvalues);
          },
        );
  }
}