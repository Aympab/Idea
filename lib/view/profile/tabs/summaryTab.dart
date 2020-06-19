part of '../profileTabs.dart';

class SummaryTab extends StatelessWidget {
  const SummaryTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page récap',
        style: const TextStyle(fontSize: 36),
      ),
    );
  }
}
