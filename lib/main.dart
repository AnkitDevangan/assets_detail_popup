import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,/**/
              children: [
                Text("Payslip History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allows horizontal scrolling
                  child: DataTable(
                    border: TableBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    columns: [
                      DataColumn(label: Text('Payslip ID')),
                      DataColumn(label: Text('Period')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Date')),
                    ],
                    rows: List.generate(
                      100,
                      (index) => _dataRow(
                        payslipId: "Sample",
                        period: "anktih",
                        amount: "12312321",
                        date: "12312321312",
                        index: index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow _dataRow({
    required String payslipId,
    required String period,
    required String amount,
    required String date,
    required int index,
  }) {
    return DataRow(
      color: WidgetStateProperty.resolveWith<Color?>((states) {
        return index.isEven ? Colors.white : Colors.grey[300];
      }),
      cells: [
        DataCell(Text(payslipId)),
        DataCell(Text(period)),
        DataCell(Text(amount)),
        DataCell(Text(date)),
      ],
    );
  }
}
