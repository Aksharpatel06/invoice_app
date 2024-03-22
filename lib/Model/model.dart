
import 'package:invoice_app/utils/productdetials.dart';

class productmodel {
  double? prize;
  int? quatity;
  String? name;
  List<productmodel>? productlist;

  productmodel({this.prize, this.quatity, this.name});

  factory productmodel.getdata(Map m1)
  {
    return productmodel(prize:m1['prize'],quatity: m1['quatity'],name: m1['name']);
  }

  refdata()
  {
    productlist = productdetails.map((e) => productmodel.getdata(e)).toList();
  }
}