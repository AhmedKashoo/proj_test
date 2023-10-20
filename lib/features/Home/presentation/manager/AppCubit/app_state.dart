part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class  GetWorkProgrammesSucess extends AppState{}
class  GetWorkProgrammesError extends AppState{
  final String Error;

  GetWorkProgrammesError(this.Error);
}
class ScanSucess extends AppState{}
class GetCounterSucess extends AppState{}
class CheckBarCodeSucess extends AppState{}
class CheckBarError extends AppState{
  final String error;

  CheckBarError(this.error);
}

class InsertSucess extends AppState{}
class InsertError extends AppState {
  final String error;

  InsertError(this.error);
}

class GetCounterError extends AppState{
  final String error;

  GetCounterError(this.error);
}

class ScanError extends AppState{
  final String error;

  ScanError(this.error);
}


