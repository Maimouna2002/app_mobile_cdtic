import 'package:flutter/material.dart';
import '../models/domain_model.dart';
import '../services/domain_service.dart';
import '../theme/colors.dart';

class CustomDomainCard extends StatefulWidget {
  const CustomDomainCard({required Key key}) : super(key: key);

  @override
  _CustomDomainCardState createState() => _CustomDomainCardState();
}

class _CustomDomainCardState extends State<CustomDomainCard> {
  List<Domain> _domains = [];

  @override
  void initState() {
    super.initState();
    _loadDomains();
  }

 Future<void> _loadDomains() async {
  List<Domain> domains = await DomainService.getDomains();
  setState(() {
    _domains = domains;
  });

  // Imprimez les données des domaines dans la console
  domains.forEach((domain) => print(domain.name));
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_domains.length, (index) {
          Domain domain = _domains[index];
          return GestureDetector(
            onTap: () {
              // Ajouter ici le code pour naviguer vers une page spécifique pour le domaine sélectionné
            },
            child: Container(
              height: size.width * .25,
              width: size.width * .25,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: textBlack.withOpacity(0.05),
                    blurRadius: 15.0,
                    offset: Offset(0, 7),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.5),
                          spreadRadius: 0.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Container(
                      child: Icon(
                        Icons.folder,
                        color: textWhite,
                        size: 15.0,
                      ),
                    ),
                  ),
                  Text(
                    domain.name,
                    style: TextStyle(
                      color: secondary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 0.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}