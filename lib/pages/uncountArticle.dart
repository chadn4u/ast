import 'package:ast_apps/models/UncountArticleModel.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';

class UncountedArticle extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _UncountedArticleState();

}

class _UncountedArticleState extends State < UncountedArticle > {

  List < UncountArticleModel > lstArticle = [
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1014370000', '8992628034159', 'BIMOLI SPC MINYAK GRG PCH 1 L', '17 Bulk Product'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
    UncountArticleModel('1107097000', '0411070970009', 'CT-8 LUXOS LUGAGGE IG-1221C RED 20', '71 Stationary/Toys'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text('Uncounted Article'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 0.9),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: lstArticle.length,
        itemBuilder: (ctx, idx) {
          return Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(143, 148, 251, 0.9),
              ),
              child: ListTile(
                leading: BarCodeImage(
                    params: Code128BarCodeParams(
                      lstArticle[idx].barcode,
                      withText: true,
                      lineWidth: .8
                    ),
                  ),
                
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    lstArticle[idx].productName, style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                ),
                subtitle: Column(
                  children: < Widget > [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(lstArticle[idx].productCode,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9
                          ), ),
                      ),
                    ), Align(
                      alignment: Alignment.centerLeft,
                      child: Text(lstArticle[idx].category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9
                        ), ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}