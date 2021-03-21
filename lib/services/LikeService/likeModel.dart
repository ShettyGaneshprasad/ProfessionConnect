class LikeModel {
  int _id;
  String _likedJobid;
  LikeModel(this._likedJobid);

  LikeModel.withId(this._id, this._likedJobid);

  int get id => _id;

  String get title => _likedJobid;

  set title(String likedJobid) {
    if (likedJobid.length <= 255) {
      this._likedJobid = likedJobid;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['likedJobid'] = _likedJobid;

    return map;
  }

  // Extract a Note object from a Map object
  LikeModel.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._likedJobid = map['likedJobid'];
  }
}
