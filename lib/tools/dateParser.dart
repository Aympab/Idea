abstract class DateParser {

  //Parse un string de la forme jj/mm/aaaa au format DateTime
  static DateTime parseStringToDateTime(String strDate) {
    DateTime date;

    String jj = strDate.substring(0, 2);
    String mm = strDate.substring(3, 5);
    String aaaa = strDate.substring(6, 10);

    date = DateTime.parse('$aaaa$mm$jj');

    return date;
  }
}
