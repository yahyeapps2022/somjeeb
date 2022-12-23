class transModel {
  final String type;
  final double amount;
  final String mobile;
  final String date;
  final String serviceName;
  final String sms;
  final String uid;
  final String? status;
  final String color;
  final String qtype;
  transModel(

      {required this.qtype,
       required this.type,
      required this.amount,
      required this.mobile,
      required this.date,
      required this.serviceName,
      required this.sms,
      required this.uid,
      required this.color,
      this.status});
}
