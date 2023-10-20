import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mac_address/mac_address.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:soundpool/soundpool.dart';

import '../../../../core/Components/components.dart';
import '../../Data/ProgramWorkModel.dart';
import '../../Data/repo.dart';
import '../../Data/util.dart';
import '../manager/AppCubit/app_cubit.dart';
import 'Widget/HomeBody.dart';

class doctor extends StatefulWidget {

  const doctor({Key? key}) : super(key: key);

  @override
  _doctorState createState() => _doctorState();
}

class _doctorState extends State<doctor> {

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var docid;
  bool floatbot = false;
  var formkey = GlobalKey<FormState>();
  var namecontroll = TextEditingController();
  var idcontroll = TextEditingController();
  var datecontroll = TextEditingController();
  var gNum = TextEditingController();
  var hourscontroll = TextEditingController();
  DateTime? date;
  bool isShow=false;
  String code="";
  var fromcontroll = TextEditingController();
  var tocontroll = TextEditingController();
  var numpatientscontroll = TextEditingController();
  var searchcontroll = TextEditingController();
  var pass = TextEditingController();
  var phone = TextEditingController();
  var OperationNumber = TextEditingController();
  String barcode='';
  var address = TextEditingController();
  String ?dropdownValue = null;
  var check;
  String result = '';
  Color c = const Color(0xfff7f7f6);
  late Color color;
  int selectedIndex = -1;
  List<Fields>tabledata=[];
String workProgramNum="";
  String Message="";

int dataindex=0;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppState>(
      listener: (BuildContext context,state){},
      builder: (BuildContext context,state){
        datecontroll.text=DateTime.now().toString().substring(0,10);
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            key: scaffoldkey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(child: Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
              ),
              backgroundColor:  Color(0xff2a2f42),
              elevation: 0,

            ),
            body: Stack(

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
                                Text(cubit.counter.toString(),style: TextStyle(
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
              if(isShow==true)SingleChildScrollView(
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
                          DataColumn(label: Text('برنامج العمل',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('الرقم التسلسلي',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('رقم المراقب',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('رقم الدفعة',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('التاريخ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('من في الميزان',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          DataColumn(label: Text('رقم رقم العملية',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                        ], rows:cubit.mainta.map((e) => DataRow(
                            color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),
                            cells: [
                              DataCell(
                                Center(child: Text(e.WorkProgrammer.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text(e.operationNum,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text(e.Controllernumber,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text(e.Batchnumber,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text(e.weight,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),

                              DataCell(
                                Center(child: Text(e.BalanceWho,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text(e.operation,style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),

                            ])).toList()),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: button(
                    text: 'أضافة عملية جديدة',
                    function: ()async{


                      scaffoldkey.currentState
                          ?.showBottomSheet(

                              (context)=>Form(

                            key: formkey,
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setbotstate)=>Container(
                                color: c,
                                padding: EdgeInsets.all(20),
                                child:SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      form(
                                        controlled_text: datecontroll,
                                        validator: (String? v) {
                                          if (v!.isEmpty) {
                                            return 'من فضلك قم بأدخال التاريخ';
                                          }
                                        },
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(child:  form(
                                              controlled_text: namecontroll,
                                              text: 'المستخدم',
                                              validator: (String? v) {
                                                if (v!.isEmpty) {
                                                  return 'من فضلك قم بأدخال المستخدم';
                                                }
                                              },
                                              prefix_icon: Icons.person,
                                              input_type: TextInputType.text),),
                                          SizedBox(width: 2,),
                                          Expanded(
                                            child: form(
                                              controlled_text: phone,
                                              text: 'رقم المراقب',
                                              prefix_icon: Icons.perm_contact_cal_outlined,
                                              validator: (String? v) {
                                                if (v!.isEmpty) {
                                                  return 'من فضلك قم بأدخال رقم المراقب';
                                                }
                                              },
                                              input_type: TextInputType.number,
                                            ),
                                          ),

                                        ],
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
                                          hint: Text('برنامج العمل'),
                                          validator: (String? v) {
                                            if (v!.isEmpty) {
                                              return 'من فضلك قم بأدخال برنامج العميل';
                                            }
                                          },
                                          value: dropdownValue,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                                          ),
                                          icon: const Icon(Icons.arrow_downward),
                                          style: const TextStyle(color: Colors.black,fontSize: 18),
                                          onChanged: (String? newValue) {
                                            setbotstate(() {
                                              dropdownValue = newValue!;
                                            for(int i=0;i<cubit.programWorkData.length;i++){
                                              if(newValue==cubit.programWorkData[i]){
                                                dataindex=i;
                                                print(dataindex);
                                                gNum.text=cubit.programWork[dataindex]['msgtv'].toString();
                                                workProgramNum=cubit.programWork[dataindex]['cle'].toString();
                                                idcontroll.text=cubit.programWork[dataindex]['pdscolis'].toString();
                                                print(workProgramNum);
                                                i++;

                                              }
                                            }

                                            });
                                          },
                                          items: cubit.programWorkData
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value,style: TextStyle(fontSize: 17),),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(child:  form(
                                            input_type: TextInputType.number,
                                            text: 'رقم الميزان',
                                            controlled_text: pass,
                                            validator: (String? v) {
                                              if (v!.isEmpty) {
                                                return 'من فضلك قم بأدخال رقم الميزان';
                                              }
                                            },
                                            prefix_icon: Icons.account_balance_rounded,

                                          ),),
                                          SizedBox(width: 2,),
                                          Expanded(
                                            child: form(
                                              controlled_text: tocontroll,
                                              text: 'من في الميزان',
                                              prefix_icon: Icons.balance,
                                              validator: (String? v) {
                                                if (v!.isEmpty) {
                                                  return 'من فضلك قم بأدخال من في الميزان';
                                                }
                                              },
                                              input_type: TextInputType.number,
                                            ),
                                          ),

                                        ],
                                      ),



                                      SizedBox(
                                        height: 10,
                                      ),

                                      Row(children: [

                                        Expanded(
                                          child: form(
                                            controlled_text: idcontroll,
                                            text: 'الوزن',
                                            enabled: false,
                                            validator: (String? v) {
                                              if (v!.isEmpty) {
                                                return 'من فضلك قم بأدخال الوزن';
                                              }
                                            },
                                            prefix_icon: Icons.account_balance_wallet_outlined,
                                            input_type: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Expanded(
                                          child: form(
                                              controlled_text: gNum,
                                              text: 'رقم الدفعة',
                                              prefix_icon: Icons.batch_prediction_outlined,
                                              input_type: TextInputType.number,
                                              enabled: false
                                          ),
                                        ),





                                      ],),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(

                                            child: form(
                                              controlled_text: OperationNumber,
                                              enabled: true,
                                              onChanged: (value){
                                                if(value != '-1'&&value.toString().length==11){
                                                  setState(() async {
                                                    OperationNumber.text=value;
                                                    code=value;
                                                    Soundpool pool = Soundpool(streamType: StreamType.notification);

                                                    int soundId = await rootBundle.load("assets/sounds/correct.mp3").then((ByteData soundData) {
                                                      return pool.load(soundData);
                                                    });
                                                    int streamId = await pool.play(soundId);
                                                    cubit.executeMySQLCheckBarCode(OperationNumber.text,namecontroll.text.toString(),tocontroll.text.toString(),phone.text.toString(),gNum.text.toString(),workProgramNum.toString(),pass.text.toString(),OperationNumber.text,idcontroll.text.toString(),context);

                                                    barcode=OperationNumber.text;

OperationNumber.clear();
cubit.executeMySQLGetCounter();

                                                  });


                                                  setState(() {
                                                    cubit.executeMySQLGetCounter();



                                                  });
                                                  setState(() {

                                                  });



                                                }else{

                                                  setState(() {
                                                    Message="عملية خاطئة";
                                                    OperationNumber.clear();
                                                    code="0";
                                                    QuickAlert.show(
                                                      title: Message,
                                                      context: context,
                                                      type: QuickAlertType.error,
                                                    );
                                                  });

                                                }

                                              },

                                              text: 'رقم العملية',
                                              input_type: TextInputType.number,
                                            ),
                                            flex: 3,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                                FontAwesomeIcons.barcode),
                                            onPressed: ()  async{
                                            await cubit.Scan(context);
                                              if(cubit.barcodeResult != '-1'&&cubit.barcodeResult.toString().length==11){
                                                setState(() async {
                                                  OperationNumber.text=cubit.barcodeResult;
                                                  code=cubit.barcodeResult;
                                                  Soundpool pool = Soundpool(streamType: StreamType.notification);

                                                  int soundId = await rootBundle.load("assets/sounds/correct.mp3").then((ByteData soundData) {
                                                    return pool.load(soundData);
                                                  });
                                                  int streamId = await pool.play(soundId);


                                                 await MySQLUtil.CheckBarCode(
                                                      "SELECT temploiyrndmscan.cle FROM temploiyrndmscan WHERE codescan = '" +OperationNumber.text+ "'").then((value) async {
                                                    print("vvvvvvvvvvvvvvvvvvvv${value.toString()}");
                                                    check=value;
                                                        if(check.isEmpty){

                                                      var address = await GetMac.macAddress;
                                                      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxx${OperationNumber.text.substring(0, 6)}");

                                                      final conn = await MySQLConnection.getConnection();

                                                      final results = await conn.query("INSERT INTO temploiyrndmscan ( quiscan,quibalanc,quicontrole,nversmn,program,macpda,ut,matbalnc,codescan,pdsnet,cleemp,date,dateh,cleferme,clevariti) VALUES( '" + namecontroll.text + "','" + tocontroll.text + "','" + phone.text + "','" + gNum.text + "','" + workProgramNum + "','" + address + "','" + "12354" + "','" + pass.text + "','" + OperationNumber.text + "','" + idcontroll.text + "','" + OperationNumber.text.substring(0,4) + "','" + DateTime.now().toString() + "','" + DateTime.now().toString() + "','','')").then((value) {

                                                        print("innnnnnnnnnnnnnnnnn$value");
                                                        QuickAlert.show(
                                                          title: "تمت العملية بنجاح",
                                                          context: context,
                                                          type: QuickAlertType.success,
                                                        );
                                                      }).catchError((e){
                                                        print(e.toString());
                                                      });
                                                      await conn.close();
                                                    }else{
                                                          Message="الكود تم مسحه من قبل";
                                                      print("ttttttttttttttttttttttttttttt");
                                                      Soundpool pool = Soundpool(streamType: StreamType.notification);

                                                      int soundId = await rootBundle.load("assets/sounds/mixkit-arcade-magic-notification-2342.wav").then((ByteData soundData) {
                                                        return pool.load(soundData);
                                                      });
                                                      int streamId = await pool.play(soundId);
                                                      QuickAlert.show(
                                                        title: Message,
                                                        context: context,
                                                        type: QuickAlertType.error,
                                                      );
                                                    }
                                                    print("cccccccccccccccccccccccc$value");
                                                  }).catchError((e){
                                                    print(e.toString());
                                                  });


                                                });



                                              }else{

                                                setState(() {
                                                  Message="عملية خاطئة";
                                                  OperationNumber.text="kkkk";
                                                  code="lll";
                                                  QuickAlert.show(
                                                    title: Message,
                                                    context: context,
                                                    type: QuickAlertType.error,
                                                  );
                                                });

                                              }

                                              setState(() {

                                              });
                                            },

                                          ),



                                          Expanded(
                                            flex:2,
                                            child: form(
                                              bordercercuilar: 0,

                                                controlled_text: barcodenum,
                                                text: 'عداد ',
                                                input_type: TextInputType.number,
                                                enabled: false
                                            ),
                                          ),


                                        ],

                                      ),
                                      SizedBox(height: 10,),

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
                                          DataColumn(label: Text('الرقم التسلسلي',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                                          DataColumn(label: Text('رقم  العملية',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                                        ], rows:cubit.ta.map((e) => DataRow(
                                            color: MaterialStateColor.resolveWith((states) =>  Color(0xfff7f7f6)),
                                            cells: [

                                              DataCell(
                                                Center(child: Text(e.operationNum,style: TextStyle(fontWeight: FontWeight.bold),)),
                                              ),



                                              DataCell(
                                                Center(child: Text(e.operation,style: TextStyle(fontWeight: FontWeight.bold),)),
                                              ),

                                            ])).toList()),
                                      ),




                                      SizedBox(height: 10,),
                                      button(
                                          text: 'عرض تفاصيل العمل',
                                          color: Color(0xff2a2f42),
                                          function: () async {
                                            if (formkey.currentState!.validate()){
                                              Navigator.pop(context);
                                              setState(() {
                                                code=OperationNumber.text;
                                                // That's it to display an alert, use other properties to customize.

                                              });












                                              setState(() {
                                               cubit.executeMySQLGetCounter();
                                               cubit.executetable();
                                                isShow=true;

                                              });
                                              setState(() {


                                              });

                                            }


                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          elevation: 15,
                          enableDrag: false
                      );

                    },
                    color: Color(0xff2a2f42),
                  ),
                )

              ],
            )
        );
      },

    );
  }




}