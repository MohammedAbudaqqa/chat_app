
class Massage{
 final String massage;
 final String id;
Massage(this.massage,this.id);


  factory Massage.fromJson(jsonData){
    return Massage(jsonData['massages'],jsonData['id']);
  }
}