class Mobotech {
  String? name,
      date,
      productType,
      mob,
      email,
      productModel,
      colour,
      serialNumber,
      imeiNum,
      issue,
      customer,
      shopname,
      warrenty,
      condition,
      price,
      estimate,
      paymentType,
      key;

  Mobotech(
      {this.name,
      this.date,
      this.mob,
      this.productType,
      this.email,
      this.productModel,
      this.colour,
      this.serialNumber,
      this.imeiNum,
      this.issue,
      this.customer,
      this.shopname,
      this.warrenty,
      this.condition,
      this.price,
      this.estimate,
      this.paymentType,
      this.key});
}

List<Mobotech> userDataList = [];
