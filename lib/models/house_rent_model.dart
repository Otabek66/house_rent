
class HouseRent {
    HouseRent({
        this.image,
        this.name,
        this.room,
        this.bedroom,
        this.wifi,
        this.rent,
        this.cost,
        this.description,
        this.owner,
    });

    String? image;
    String? name;
    String? room;
    String? bedroom;
    String? wifi;
    String? rent;
    String? cost;
    String? description;
    String? owner;



    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "room": room,
        "bedroom": bedroom,
        "wifi": wifi,
        "rent": rent,
        "cost": cost,
        "description": description,
        "owner": owner,
    };
}
