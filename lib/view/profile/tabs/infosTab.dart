part of '../profileTabs.dart';

class InfosTab extends StatelessWidget {
  const InfosTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page infos générales',
        style: const TextStyle(fontSize: 36),
      ),
    );
  }
}
