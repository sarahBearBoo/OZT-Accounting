class ModuleTilesData {
  String imagePath, name, desc;

  ModuleTilesData({this.imagePath, this.name, this.desc});

  // SETTERS
  void setImagePath(String imagePath) { this.imagePath = imagePath; }
  void setName(String text) { this.name = text; }
  void setDesc(String desc) { this.desc = desc; }

  // GETTERS
  String getImagePath() { return imagePath; }
  String getName() {  return name; }
  String getDesc() {  return desc; }

}

// Function:  Return data to be included in the tiles
List<ModuleTilesData> getModuleTiles() {

  List<ModuleTilesData> moduleList = [];

  // 1
  ModuleTilesData tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Quotation.png');
  tile.setName('Quotation');
  tile.setDesc('Description for quotation.');

  moduleList.add(tile);

  // 2
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Invoice.png');
  tile.setName('Invoice');
  tile.setDesc('Description for invoice.');

  moduleList.add(tile);

  // 3
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Expenses.png');
  tile.setName('Expenses');
  tile.setDesc('Description for expenses.');

  moduleList.add(tile);

  // 4
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Income.png');
  tile.setName('Income');
  tile.setDesc('Description for income.');

  moduleList.add(tile);

  // 5
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Cash Book.png');
  tile.setName('Cash Book');
  tile.setDesc('Description for cash book.');

  moduleList.add(tile);

  // 6
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Ledger Book.png');
  tile.setName('Ledger Book');
  tile.setDesc('Description for ledger book.');

  moduleList.add(tile);

  // 7
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Quick Entry.png');
  tile.setName('Quick Entry');
  tile.setDesc('Description for quick entry.');

  moduleList.add(tile);

  // 8
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Reports.png');
  tile.setName('Reports');
  tile.setDesc('Description for reports.');

  moduleList.add(tile);

  // 9
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Profit And Loss.png');
  tile.setName('Profit And Loss');
  tile.setDesc('Description for module.');

  moduleList.add(tile);

  // 10
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Balance Sheet.png');
  tile.setName('Balance Sheet');
  tile.setDesc('Description for module.');

  moduleList.add(tile);

  // 11
  tile = new ModuleTilesData();
  tile.setImagePath('assets/images/Client.png');
  tile.setName('Client');
  tile.setDesc('Description for client.');

  moduleList.add(tile);


  return moduleList;

}