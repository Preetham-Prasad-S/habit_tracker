abstract interface class Success {
  final dynamic data;

  Success({this.data});
}

class Data implements Success {
  @override
  final dynamic data;

  Data({required this.data});
}
