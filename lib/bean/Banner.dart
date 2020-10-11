class Banner {
  List<BannerEntity> data;
  int errorCode;
  String errorMsg;

  Banner(this.data, this.errorCode, this.errorMsg);

  Banner.from(Map<String, dynamic> json) {
    data = json["data"];
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["data"] = this.data;
    data["errorCode"] = this.errorCode;
    data["errorCode"] = this.errorCode;
    return data;
  }
}

class BannerEntity {
  int id;
  String desc;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerEntity(this.id, this.desc, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  BannerEntity.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    desc = json["desc"];
    imagePath = json["imagePath"];
    isVisible = json["isVisible"];
    order = json["order"];
    title = json["title"];
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["desc"] = this.desc;
    data["imagePath"] = this.imagePath;
    data["isVisible"] = this.isVisible;
    data["order"] = this.order;
    data["title"] = this.title;
    data["type"] = this.type;
    data["url"] = this.url;
    return data;
  }
}
