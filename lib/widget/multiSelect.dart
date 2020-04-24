import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

class MultiSelectWidget extends StatelessWidget {
  String titleMultiSelect;
  String textFieldName;
  String textFieldValue;
  List objectList;
  List selectedvalues;

  MultiSelectWidget({this.titleMultiSelect, this.textFieldName, this.textFieldValue, this.objectList, this.selectedvalues});

  @override
  Widget build(BuildContext context) {
    return MultiSelect(
          titleText: titleMultiSelect,
          dataSource: objectList,
          textField: textFieldName,
          valueField: textFieldValue,
          filterable: true,
          value: null,
          change: (values) {
            selectedvalues = values;
          },
        );
  }
}