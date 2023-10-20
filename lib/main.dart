import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundpool/soundpool.dart';

import 'features/Home/Data/util.dart';
import 'features/Home/presentation/manager/AppCubit/BlocOpserver.dart';
import 'features/Home/presentation/manager/AppCubit/app_cubit.dart';
import 'features/Home/presentation/view/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..executeMySQLQuery()..executeMySQLGetCounter()..executetable()..executeMaintable(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'MySQL Client',
        home: Directionality(

            textDirection: TextDirection.rtl,
            child: doctor())
      ),
    );
  }

  void executeMySQLQuery() async {
    final results = await MySQLUtil.executeQuery(
        "select tdetaioperationmov.cle,tdetaioperationmov.msgtv,pdscolis,tdetaioperationmov.n,tdetaioperationmov.nop ,CONCAT('      L:',tdetaioperationmov.N , '   ','N:',tdetaioperationmov.nop , '   ',tprogrameaffemply.nomaff)  AS nomaff from tprogrameaffemply,tdetaioperationmov WHERE tdetaioperationmov.cleprograme=tprogrameaffemply.cle and tdetaioperationmov.AFFTV=1 GROUP BY tdetaioperationmov.cle ");
    print(results);
  }
}
Widget g(){
  return Scaffold(
    appBar: AppBar(
      title: Text('MySQL Client'),
    ),
    body: Center(
      child: ElevatedButton(
        child: Text('Execute Query'),
        onPressed: () async{
          Soundpool pool = Soundpool(streamType: StreamType.notification);

          int soundId = await rootBundle.load("assets/sounds/correct.mp3").then((ByteData soundData) {
            return pool.load(soundData);
          });
          int streamId = await pool.play(soundId);
         // executeMySQLQuery();
        },
      ),
    ),
  );
}