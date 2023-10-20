import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../../../core/Components/components.dart';
import '../../../Data/repo.dart';
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();

}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
  }

  var docid;
  bool floatbot = false;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var namecontroll = TextEditingController();
  var idcontroll = TextEditingController();
  var datecontroll = TextEditingController();
  var patientdatecontroll = TextEditingController();
  var hourscontroll = TextEditingController();
  DateTime? date;
  String code="";
  var fromcontroll = TextEditingController();
  var tocontroll = TextEditingController();
  var numpatientscontroll = TextEditingController();
  var searchcontroll = TextEditingController();
  var pass = TextEditingController();
  var phone = TextEditingController();
  var OperationNumber = TextEditingController();
  var address = TextEditingController();
  String ?dropdownValue = null;
  String ?gender = null;
  List<Map<String,dynamic>>listitem=<Map<String,dynamic>>[];

  String result = '';
  bool isvisible = true;
  Color c = const Color(0xfff7f7f6);
  late Color color;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(

      alignment: Alignment.bottomCenter,
      children: [

        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height ,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery
        .of(context)
        .size
        .height *.3,
                  decoration: BoxDecoration(
                    color: Color(0xff2a2f42),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('عدد البار كود الذي تم مسحه',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28
                        ),),
                        SizedBox(height: 15,),
                        Text('22',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28
                        ),),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height *.3,


                  decoration: BoxDecoration(
                    color: Color(0xff2a2f42),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('أخر بار كود  تم مسحه',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28
                        ),),
                        SizedBox(height: 15,),
                        Text(code,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),

                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: DataTable(

                    border: TableBorder.symmetric(outside: BorderSide.none,inside: BorderSide(color: Colors.black12)),

                    showCheckboxColumn: false,
                    headingRowColor:
                    MaterialStateColor.resolveWith((states) =>  Color(0xff2a2f42)),
                    onSelectAll: (val) {
                      setState(() {
                        selectedIndex = -1;
                      });
                    }, columns: [
                  DataColumn(label: Text('رقم العملية',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('اسم المنتج',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('سعرالمنتج',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('سعرالمنتج',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                ], rows: [
                  DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),
                  DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),DataRow(
                      color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),

                      cells: [


                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('00455',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('Bmw car',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                        DataCell(
                          Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),

                      ]),

                ]),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: button(
            text: 'أضافة عملية جديدة',
            function: (){
              scaffoldkey.currentState
                  ?.showBottomSheet(
                      (context)=>Form(
                    key: formkey,
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setbotstate)=>Container(
                        color: c,
                        padding: EdgeInsets.all(20),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            form(
                                controlled_text: namecontroll,
                                text: 'المستخدم',
                                prefix_icon: Icons.person,
                                input_type: TextInputType.text),
                            SizedBox(
                              height: 10,
                            ),
                            form(
                              input_type: TextInputType.number,
                              text: 'رقم الميزان',
                              controlled_text: pass,
                              prefix_icon: Icons.account_balance_rounded,

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: c,
                                border: Border.all(
                                    width: 0.5
                                ),
                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: DropdownButtonFormField<String>(
                                hint: Text('برنامج العميل'),
                                value: dropdownValue,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                                ),
                                icon: const Icon(Icons.arrow_downward),
                                style: const TextStyle(color: Colors.black,fontSize: 18),
                                onChanged: (String? newValue) {
                                  setbotstate(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>['Dentist', 'Cardiologist', 'Neurologist', 'Dermatologist','Emergency','Psychiatrist','Surgeon','Pediatrician ','Radiologist','Hematologist','Oncologist']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            form(
                              controlled_text: namecontroll,
                              text: 'رقم المراقب',
                              prefix_icon: Icons.perm_contact_cal_outlined,
                              input_type: TextInputType.number,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            form(
                              controlled_text: namecontroll,
                              text: 'رقم الدفعة',
                              prefix_icon: Icons.batch_prediction_outlined,
                              input_type: TextInputType.number,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Row(children: [

                              Expanded(
                                child: form(
                                  controlled_text: namecontroll,
                                  text: 'من في الميزان',
                                  prefix_icon: Icons.balance,
                                  input_type: TextInputType.number,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: form(
                                  controlled_text: namecontroll,
                                  text: 'الوزن',
                                  prefix_icon: Icons.account_balance_wallet_outlined,
                                  input_type: TextInputType.number,
                                ),
                              ),


                            ],),
                            SizedBox(
                              height: 10,
                            ),
                            form(
                              controlled_text: datecontroll,
                              text: 'التاريخ',
                              tap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960,8),
                                    lastDate: DateTime.parse(
                                        '2050-11-20'))
                                    .then((value) {
                                  datecontroll.text =
                                      DateFormat.yMMMd()
                                          .format(value!);
                                });
                              },
                              prefix_icon: Icons.calendar_today,
                              input_type: TextInputType.datetime,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: form(
                                    controlled_text: OperationNumber,
                                    enabled: false,
                                    text: 'رقم العملية',
                                    input_type: TextInputType.number,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                      FontAwesomeIcons.barcode),
                                  onPressed: () async {
                                    var res = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SimpleBarcodeScannerPage(),
                                        )).then((value) {


                                      OperationNumber.text=value;
                                    });
                                    setState(() {
                                      OperationNumber.text=res;
                                    });

                                  },

                                ),

                              ],

                            ),



                            SizedBox(height: 10,),
                            button(
                                text: 'تأكيد',
                                color: Color(0xff2a2f42),
                                function: (){
                                  Navigator.pop(context);
                                  setState(() {
                                    code=OperationNumber.text;
                                  });
                                  setState(() {

                                  });

                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  elevation: 15
              );

            },
            color: Color(0xff2a2f42),
          ),
        )

      ],
    );
  }
}
