class UserInfo{

  static final UserInfo _instance = UserInfo._privateConstructor();
  factory UserInfo() {
    return _instance;
  }
  UserInfo._privateConstructor();

  String? FirstName;
  String? SurName;
  String? Patronymyc;
  String? Phone;

  String? FullName;

  String GetName(){
    return "Василий Сергеевич";
    if(FullName == null)
    {
      FullName = "${FirstName??""} ${SurName??""} ${Patronymyc?[0]??""}.";
    }
    return FullName??"";
  }
  String GetPhone(){
    return Phone??"Не заполнен";
  }
}
