class Response {
  int status;
  String msg;

  Response({required this.status, required this.msg});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(status: json['status'] , msg: json['msg']);
  }

  toJson() => {
    "status":status,
    "msg": msg,
  };



}
