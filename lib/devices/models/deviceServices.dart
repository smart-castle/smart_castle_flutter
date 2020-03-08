class DeviceServices {
  String key;
  int typ;
  String name;
  Map data = Map();

  DeviceServices({
    this.typ,
    this.name,
  });

  DeviceServices.fromMap(String key, Map service) {
    key = this.key;
    typ = int.parse(service['type']);
    name = service['name'];
    data = service['data'];
  }

  toJason() {
    return {
      //TODO fix to Jason
      'typ': typ,
      'name': name,
      'data': data,
    };
  }
}
