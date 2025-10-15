import '../pagination_info.dart';
import '../subcategory_dto.dart';

/// results : 10
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6407f40db575d3b90bf957fa","name":"Computer Accessories","slug":"computer-accessories","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:33:49.497Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f402b575d3b90bf957f7","name":"Computer Components","slug":"computer-components","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:33:38.069Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3f6b575d3b90bf957f4","name":"Data Storage","slug":"data-storage","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:33:26.513Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3e3b575d3b90bf957f1","name":"Networking Products","slug":"networking-products","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:33:07.413Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3d8b575d3b90bf957ee","name":"Printers & Accessories","slug":"printers-and-accessories","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:32:56.016Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3ccb575d3b90bf957eb","name":"Cameras & Accessories","slug":"cameras-and-accessories","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:32:44.305Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3c0b575d3b90bf957e8","name":"Video Games","slug":"video-games","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:32:32.504Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3b4b575d3b90bf957e5","name":"Audio & Home Entertainment","slug":"audio-and-home-entertainment","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:32:20.108Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f3a8b575d3b90bf957e2","name":"Laptops & Accessories","slug":"laptops-and-accessories","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:32:08.305Z","updatedAt":"2023-04-14T23:00:38.611Z"},{"_id":"6407f39bb575d3b90bf957df","name":"TVs, Satellites & Accessories","slug":"tvs-satellites-and-accessories","category":"6439d2d167d9aa4ca970649f","createdAt":"2023-03-08T02:31:55.083Z","updatedAt":"2023-04-14T23:00:38.611Z"}]

class SubcategoriesResponse {
  SubcategoriesResponse({this.results, this.metadata, this.data});

  SubcategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null
            ? PaginationInfo.fromJson(json['metadata'])
            : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubcategoryDto.fromJson(v));
      });
    }
  }

  num? results;
  PaginationInfo? metadata;
  List<SubcategoryDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
