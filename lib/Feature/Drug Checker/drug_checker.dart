import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Drug_checher extends StatefulWidget {
  const Drug_checher({super.key});

  @override
  State<Drug_checher> createState() => _Drug_checherState();
}

class _Drug_checherState extends State<Drug_checher> {
  final now = DateTime.now();
  late final formatted = DateFormat('EEEE, MMMM d, y').format(now);
  List data = ["Dosage", "Age", "Interactions", "PDF Reports"];
  List phraghs = [
    "View and manage your comprehensive medical files.",
    "Access your latest blood work and other lab results.",
    "X_rays , MRIs and other diagnostics images.",
    "View and download all your reports in PDF format.",
  ];
  List<IconData> phraghsicon = [
    Icons.edit,
    CupertinoIcons.lab_flask,
    Icons.image,
    Icons.picture_as_pdf,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: Text("data")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Drug Checker",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Color(0xff207EFF), Color(0xffC6D8FD)],
                        begin: Alignment.topRight,
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${data[index]}"),
                              ),
                              Icon(
                                phraghsicon[index],
                                color: Color(0xff207EFF),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${phraghs[index]}",
                              style: TextStyle(fontSize: 9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff207EFF), Color(0xffC6D8FD)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Compare Reports",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.transform, color: Color(0xff207EFF)),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Compare old and new reports to track your progress.",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Start comparison",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
