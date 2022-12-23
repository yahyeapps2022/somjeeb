void main() {
  List<String?> val = ['yahye',null]; // <- value is null
  print(val![1]); // <- will crash
//  print(value?.toLowerCase().toUpperCase());  // <- will crash
 // print(value?.toLowerCase()?.toUpperCase()); // <- output is null
}
