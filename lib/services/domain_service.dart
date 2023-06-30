import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/domain_model.dart';

class DomainService {
  static const String _baseUrl = "http://127.0.0.1:8000/api/";
  static const String _domainEndpoint = "domains";

  static Future<List<Domain>> getDomains() async {
    final response = await http.get(Uri.parse(_baseUrl + _domainEndpoint));
    if (response.statusCode == 200) {
      List<dynamic> domainsJson = jsonDecode(response.body);
      return domainsJson.map((json) => Domain.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load domains');
    }
  }
}