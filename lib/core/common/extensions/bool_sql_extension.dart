extension ToSql on bool{
  int toNumber(){
    switch (this){
      case true:
        return 1;
      case false:
        return 0;
      default:
        return 0;
    }
  }
}

extension FromSql on int{
  bool toBool(){
    switch (this){
      case 1:
        return true;
      case 0:
        return false;
      default:
        return false;
    }
  }
}