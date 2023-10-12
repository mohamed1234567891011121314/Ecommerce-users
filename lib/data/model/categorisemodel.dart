class CategoryModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatatime;

  CategoryModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatatime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['categories_id'] = this.categoriesId;
    // ignore: unnecessary_this
    data['categories_name'] = this.categoriesName;
    // ignore: unnecessary_this
    data['categories_name_ar'] = this.categoriesNameAr;
    // ignore: unnecessary_this
    data['categories_image'] = this.categoriesImage;
    // ignore: unnecessary_this
    data['categories_datatime'] = this.categoriesDatatime;
    return data;
  }
}
