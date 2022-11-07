import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:intl/intl.dart';

class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  sample(String agentName, String supId, String supName, int grossWeight,
      int totDeduct, int netWeight) async {
    DateTime dateTime = DateTime.now();
    final DateFormat timeNow = DateFormat('Hms');
    final String timeNowFormat = timeNow.format(dateTime);
    final DateFormat dateNow = DateFormat('d/MMMM/y');
    final String dateNowFormat = dateNow.format(dateTime);
    //var timeNow = dateTime.format('H:i');
    //var dateNow = dateTime.format('d/m/Y');
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT

//     var response = await http.get("IMAGE_URL");
//     Uint8List bytes = response.bodyBytes;
    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printNewLine();
        bluetooth.printCustom("Mexico Bahari Pte. Ltd.", 4, 1);
        bluetooth.printCustom("Clubhouse", 4, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom(dateNowFormat.toString(), 1, 1);
        bluetooth.printNewLine();
        bluetooth.printCustom(timeNowFormat.toString(), 1, 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Agent Name :", agentName.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Supplier ID :", supId.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Supplier Name :", supName.toString(), 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight(
            "Gross Weight :", grossWeight.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight(
            "Total Deduction", totDeduct.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight(
            "Net Weight :", netWeight.toString() + " Kg", 1);
        bluetooth.printNewLine();
        bluetooth.printCustom("Thank You ...!", 3, 1);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        //bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }
}
