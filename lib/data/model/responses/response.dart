class AppResponse {
  int status;
  String msg;

  AppResponse({required this.status, required this.msg});

  factory AppResponse.fromJson(Map<String, dynamic> json) {
    return AppResponse(status: json['status'] , msg: json['msg']);
  }

  toJson() => {
    "status":status,
    "msg": msg,
  };



}
