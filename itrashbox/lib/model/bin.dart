class Bin {
 int id;
 String name;
 int status;
 int no;

 Bin(
 {   this.id,this.name,this.status,this.no });
 
 Bin.fromJson(Map<String,dynamic> json){
   id = json['id'];
   name = json['name'];
   status = json['status'];
   no = json['no'];
 }
 Map<String, dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] = this.id;
   data['name'] = this.name;
   data['status'] = this.status;
   data['no'] = this.no;
   return data;
 }
}