import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mac_address/mac_address.dart';
import 'package:meta/meta.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:soundpool/soundpool.dart';

import '../../../../../core/Components/components.dart';
import '../../../Data/ProgramWorkModel.dart';
import '../../../Data/repo.dart';
import '../../../Data/util.dart';
import '../../view/Home.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=>BlocProvider.of(context);
  List<dynamic>programWork=[];
  List<String>programWorkData=[];
  List<String>programWorknum=[];
String barcode="";
  var counter;
var barcodeResult;
bool isShow=false;
var checkBarCodeNumber;
  void executeMySQLQuery() async {
     await MySQLUtil.executeQuery(
        "select tdetaioperationmov.cle,tdetaioperationmov.msgtv,pdscolis,tdetaioperationmov.n,tdetaioperationmov.nop ,CONCAT('      L:',tdetaioperationmov.N , '   ','N:',tdetaioperationmov.nop , '   ',tprogrameaffemply.nomaff)  AS nomaff from tprogrameaffemply,tdetaioperationmov WHERE tdetaioperationmov.cleprograme=tprogrameaffemply.cle and tdetaioperationmov.AFFTV=1 GROUP BY tdetaioperationmov.cle ").then((value) {
         programWork=value;
         print(programWork);

         programWork.forEach((element) {
           programWorkData.add(element['nomaff']);
           emit(GetWorkProgrammesSucess());


         });
          emit(GetWorkProgrammesSucess());
    }).catchError((error){
      emit(GetWorkProgrammesError(error.toString()));
      print(error.toString());
    });
  }

  Future<void>Scan(BuildContext context)async{

    barcodeResult = await Navigator.push(
          context,
          MaterialPageRoute(
            maintainState: false,
            builder: (context) => const SimpleBarcodeScannerPage(),
          ));

      
      emit(ScanSucess());
      print(barcodeResult);
      emit(ScanSucess());

  }





  void executeMySQLGetCounter() async {
    var address = await GetMac.macAddress;
    var date=DateTime.now().toString().substring(0,11);
    print(DateTime.now());

    await MySQLUtil.GetCounter(
        "SELECT Count(temploiyrndmscan.cle) AS NBR FROM temploiyrndmscan WHERE temploiyrndmscan.date = '" +date + "' and temploiyrndmscan.macpda = '" + address + "' GROUP BY macpda").then((value) {

              counter=value[0]['NBR'];
              print("cccccccccccccccccccccccc$counter");
              emit(GetCounterSucess());
    }).catchError((e){
      print(e.toString());
      emit(GetCounterError(e));
    });

  }




  void executeMySQLCheckBarCode(var operationNumber,var user,var weightWho,var controllerNumber,var batchnum,var workProgramNumber,var balnceNum,var operationNum,var weight ,BuildContext context)async {
    var address = await GetMac.macAddress;
    var date=DateTime.now().toString().substring(0,11);
    print(DateTime.now());

    await MySQLUtil.CheckBarCode(
        "SELECT temploiyrndmscan.cle FROM temploiyrndmscan WHERE codescan = '" +operationNumber+ "'").then((value) async {
          checkBarCodeNumber=value;
          emit(CheckBarCodeSucess());

          if(checkBarCodeNumber.isEmpty){
            Insert( user, weightWho, controllerNumber, batchnum, workProgramNumber, balnceNum, operationNum, weight,context);
          }else{

            print("ttttttttttttttttttttttttttttt");
            Soundpool pool = Soundpool(streamType: StreamType.notification);

            int soundId = await rootBundle.load("assets/sounds/mixkit-arcade-magic-notification-2342.wav").then((ByteData soundData) {
              return pool.load(soundData);
            });
            int streamId = await pool.play(soundId);
            QuickAlert.show(
              title:" الكود تم مسحه من قبل",
              context: context,
              type: QuickAlertType.error,
            );
          }

    }).catchError((e){
      emit(CheckBarError(e));
      print("CheckBar Code Error$e");
    });

  }


Future<void>Insert(var user,var weightWho,var controllerNumber,var batchnum,var workProgramNumber,var balnceNum,var operationNum,var weight,BuildContext context)async{
  emit(AppInitial());
    var address = await GetMac.macAddress;

  final conn = await MySQLConnection.getConnection();

  final results = await conn.query("INSERT INTO temploiyrndmscan ( quiscan,quibalanc,quicontrole,nversmn,program,macpda,ut,matbalnc,codescan,pdsnet,cleemp,date,dateh,cleferme,clevariti) VALUES( '" + user + "','" + weightWho + "','" + controllerNumber + "','" + batchnum + "','" + workProgramNumber + "','" + address + "','" + "12354" + "','" + balnceNum + "','" + operationNum + "','" + weight + "','" + operationNum.substring(0,4) + "','" + DateTime.now().toString() + "','" + DateTime.now().toString() + "','','')").then((value) {

    executeMySQLGetCounter();
    QuickAlert.show(
      title:"عملية ناجحة",
      context: context,
      type: QuickAlertType.success,
    );
    barcodenum.text=counter.toString();


    emit(InsertSucess());
  }).catchError((e){
    print(e);
    emit(InsertError(e));
  });
  await conn.close();
  executeMySQLGetCounter();
  }



  List<dynamic> mainresList=[];
  List<dynamic>mainresListTable=[];
List<Fields>mainta=[];




  void executeMaintable() async {

    var address = await GetMac.macAddress;
    var date=DateTime.now().toString().substring(0,11);

    await MySQLUtil.executeQuery(
        "SELECT temploiyrndmscan.codescan AS codescan,tprogrameaffemply.nomaff,temploiyrndmscan.pdsnet,temploiyrndmscan.nversmn,temploiyrndmscan.quiscan AS quiscan,temploiyrndmscan.quibalanc AS quibalanc,temploiyrndmscan.quicontrole,temploiyrndmscan.numbalc FROM temploiyrndmscan,tdetaioperationmov,tprogrameaffemply WHERE temploiyrndmscan.program = tdetaioperationmov.cle and tdetaioperationmov.cleprograme=tprogrameaffemply.cle AND temploiyrndmscan.date ='" +date + "' and temploiyrndmscan.macpda =  '" + address + "' GROUP BY temploiyrndmscan.cle LIMIT 100 ").then((value) {
          print("ssssssssssssssssssssssssss$value");
          mainresList=value;
          mainresList.forEach((element) {
            mainresListTable.add(Fields(User: element['quiscan'].toString(), BalanceWho: element['quibalanc'].toString(), Batchnumber: element['nversmn'].toString(), Controllernumber: element['quicontrole'].toString(), operationNum: element['codescan'].toString(), WorkProgrammer: element['nomaff'].toString(), weight: element['pdsnet'].toString(), operation: element['codescan'].toString().substring(0,4)));
   });
   mainresListTable.forEach((element) {
     mainta.add(element);
   });
   print(ta[0].operationNum);

    }).catchError((error){
print(error.toString());
    });
  }


  List<dynamic> resList=[];
  List<dynamic> resListTable=[];
  List<Fields>ta=[];




  void executetable() async {

    var address = await GetMac.macAddress;
    var date=DateTime.now().toString().substring(0,11);

    await MySQLUtil.executeQuery(
        "SELECT temploiyrndmscan.codescan AS codescan,tprogrameaffemply.nomaff,temploiyrndmscan.pdsnet,temploiyrndmscan.nversmn,temploiyrndmscan.quiscan AS quiscan,temploiyrndmscan.quibalanc AS quibalanc,temploiyrndmscan.quicontrole,temploiyrndmscan.numbalc FROM temploiyrndmscan,tdetaioperationmov,tprogrameaffemply WHERE temploiyrndmscan.program = tdetaioperationmov.cle and tdetaioperationmov.cleprograme=tprogrameaffemply.cle AND temploiyrndmscan.date ='" +date + "' and temploiyrndmscan.macpda =  '" + address + "' GROUP BY temploiyrndmscan.cle LIMIT 10 ").then((value) {
      print("ssssssssssssssssssssssssss$value");
      resList=value;
      resList.forEach((element) {
        resListTable.add(Fields(User: element['quiscan'].toString(), BalanceWho: element['quibalanc'].toString(), Batchnumber: element['nversmn'].toString(), Controllernumber: element['quicontrole'].toString(), operationNum: element['codescan'].toString(), WorkProgrammer: element['nomaff'].toString(), weight: element['pdsnet'].toString(), operation: element['codescan'].toString().substring(0,4)));
      });
      resListTable.forEach((element) {
        ta.add(element);
      });
      print(ta[0].operationNum);

    }).catchError((error){
      print(error.toString());
    });
  }

}







//final results = await conn.query("INSERT INTO temploiyrndmscan ( quiscan,quibalanc,quicontrole,nversmn,program,macpda,ut,matbalnc,codescan,pdsnet,cleemp,date,dateh,cleferme,clevariti) VALUES( '" + namecontroll.text + "','" + tocontroll.text + "','" + phone.text + "','" + gNum.text + "','" + workProgramNumber + "','" + address + "','" + "12354" + "','" + pass.text + "','" + OperationNumber.text + "','" + idcontroll.text + "','" + OperationNumber.text.substring(0,4) + "','" + DateTime.now().toString() + "','" + DateTime.now().toString() + "','','')")