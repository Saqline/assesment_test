// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    bool success;
    String message;
    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;
    int total;

    DataModel({
        required this.success,
        required this.message,
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        this.nextPageUrl,
        required this.path,
        required this.perPage,
        this.prevPageUrl,
        required this.to,
        required this.total,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json["success"],
        message: json["message"],
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    String? uuid;
    String? businessName;
    dynamic categoryId;
    String? vatNo;
    String? regNo;
    String? idNo;
    String? type;
    String? email;
    String? phone;
    String? note;
    String? webLink;
    int? highlight;
    String? category;
    dynamic keyword;
    String? imagePath;
    String? backgroundImagePath;
    Cashback? file;
    Cashback? cashback;

    Datum({
        this.uuid,
        this.businessName,
        this.categoryId,
        this.vatNo,
        this.regNo,
        this.idNo,
        this.type,
        this.email,
        this.phone,
        this.note,
        this.webLink,
        this.highlight,
        this.category,
        this.keyword,
        this.imagePath,
        this.backgroundImagePath,
        this.file,
        this.cashback,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        businessName: json["business_name"],
        categoryId: json["category_id"],
        vatNo: json["vat_no"],
        regNo: json["reg_no"],
        idNo: json["id_no"],
        type: json["type"],
        email: json["email"],
        phone: json["phone"],
        note: json["note"],
        webLink: json["web_link"],
        highlight: json["highlight"],
        category: json["category"],
        keyword: json["keyword"],
        imagePath: json["image_path"],
        backgroundImagePath: json["background_image_path"],
        file: json["file"] == null ? null : Cashback.fromJson(json["file"]),
        cashback: json["cashback"] == null ? null : Cashback.fromJson(json["cashback"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "business_name": businessName,
        "category_id": categoryId,
        "vat_no": vatNo,
        "reg_no": regNo,
        "id_no": idNo,
        "type": type,
        "email": email,
        "phone": phone,
        "note": note,
        "web_link": webLink,
        "highlight": highlight,
        "category": category,
        "keyword": keyword,
        "image_path": imagePath,
        "background_image_path": backgroundImagePath,
        "file": file?.toJson(),
        "cashback": cashback?.toJson(),
    };
}

class Cashback {
    Cashback();

    factory Cashback.fromJson(Map<String, dynamic> json) => Cashback(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Link {
    dynamic url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
