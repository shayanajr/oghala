import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ProfileModel extends HiveObject {
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.identity,
    this.mobile,
    // this.lastLogin,
    this.firstName,
    this.lastName,
    this.idNumber,
    this.birthdate,
    this.gender,
    this.avatar,
    this.ipRegister,
    this.registerSource,
    this.homepage,
    this.phone,
    this.address1,
    this.address2,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.bankName,
    this.bankCard,
    this.bankAccount,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? identity;
  @HiveField(4)
  final String? mobile;

  // @HiveField(5)
  // final bool? lastLogin;
  @HiveField(5)
  final String? firstName;
  @HiveField(6)
  final String? lastName;
  @HiveField(7)
  final int? idNumber;
  @HiveField(8)
  final String? birthdate;
  @HiveField(9)
  final String? gender;
  @HiveField(10)
  final String? avatar;
  @HiveField(11)
  final String? ipRegister;
  @HiveField(12)
  final String? registerSource;
  @HiveField(13)
  final String? homepage;
  @HiveField(14)
  final String? phone;
  @HiveField(15)
  final String? address1;
  @HiveField(16)
  final String? address2;
  @HiveField(17)
  final String? country;
  @HiveField(18)
  final String? state;
  @HiveField(19)
  final String? city;
  @HiveField(20)
  final String? zipCode;
  @HiveField(21)
  final String? bankName;
  @HiveField(22)
  final String? bankCard;
  @HiveField(23)
  final String? bankAccount;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      identity: json["identity"],
      mobile: json["mobile"],
      // lastLogin: json["last_login"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      idNumber: json["id_number"],
      birthdate: json["birthdate"],
      gender: json["gender"],
      avatar: json["avatar"],
      ipRegister: json["ip_register"],
      registerSource: json["register_source"],
      homepage: json["homepage"],
      phone: json["phone"],
      address1: json["address_1"],
      address2: json["address_2"],
      country: json["country"],
      state: json["state"],
      city: json["city"],
      zipCode: json["zip_code"],
      bankName: json["bank_name"],
      bankCard: json["bank_card"],
      bankAccount: json["bank_account"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "identity": identity,
        "mobile": mobile,
        // "last_login": lastLogin,
        "first_name": firstName,
        "last_name": lastName,
        "id_number": idNumber,
        "birthdate": birthdate,
        "gender": gender,
        "avatar": avatar,
        "ip_register": ipRegister,
        "register_source": registerSource,
        "homepage": homepage,
        "phone": phone,
        "address_1": address1,
        "address_2": address2,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "bank_name": bankName,
        "bank_card": bankCard,
        "bank_account": bankAccount,
      };
}

class ProfileAdapter extends TypeAdapter<ProfileModel> {
  @override
  int get typeId => 1;

  @override
  ProfileModel read(BinaryReader reader) {
    int numOfFields = reader.readByte();
    Map fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return ProfileModel(
      id: fields[0],
      name: fields[1],
      email: fields[2],
      identity: fields[3],
      mobile: fields[4],
      // lastLogin: fields[5],
      firstName: fields[5],
      lastName: fields[6],
      idNumber: fields[7],
      birthdate: fields[8],
      gender: fields[9],
      avatar: fields[10],
      ipRegister: fields[11],
      registerSource: fields[12],
      homepage: fields[13],
      phone: fields[14],
      address1: fields[15],
      address2: fields[16],
      country: fields[17],
      state: fields[18],
      city: fields[19],
      zipCode: fields[20],
      bankName: fields[21],
      bankCard: fields[22],
      bankAccount: fields[23],
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.identity)
      ..writeByte(4)
      ..write(obj.mobile)
      // ..writeByte(5)
      // ..write(obj.lastLogin)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.idNumber)
      ..writeByte(8)
      ..write(obj.birthdate)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.avatar)
      ..writeByte(11)
      ..write(obj.ipRegister)
      ..writeByte(12)
      ..write(obj.registerSource)
      ..writeByte(13)
      ..write(obj.homepage)
      ..writeByte(14)
      ..write(obj.phone)
      ..writeByte(15)
      ..write(obj.address1)
      ..writeByte(16)
      ..write(obj.address2)
      ..writeByte(17)
      ..write(obj.country)
      ..writeByte(18)
      ..write(obj.state)
      ..writeByte(19)
      ..write(obj.city)
      ..writeByte(20)
      ..write(obj.zipCode)
      ..writeByte(21)
      ..write(obj.bankName)
      ..writeByte(22)
      ..write(obj.bankCard)
      ..writeByte(23)
      ..write(obj.bankAccount);
  }
}
