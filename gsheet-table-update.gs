var openSheet = SpreadsheetApp.getActiveSpreadsheet(),
active_sheet = openSheet.getSheets(); 

function doPost(e) {

  var param = e.parameter;
  var name = param.name;
  var ext_ip = param.ext_ip;
  var int_ip = param.int_ip;
  var machine = param.machine;
  var project = param.project;
  var tag;
  for (var id=0; id<active_sheet.length;id++){
 
    if(project==active_sheet[id].getName()){
      tag=id;
    }
  }

  var last_row = active_sheet[tag].getLastRow();
  var vm_data_column = 1;//set instance column 
  var ext_data_column = 2;//set external_ip column 
  var int_data_column = 3;//set internal_ip column 
  var mach_data_column = 4;//set machine column 
 
 //set amount
  var vm_data = active_sheet[tag].getSheetValues(1,vm_data_column,100,1);
  var exist=0;
  var values = [
    name, ext_ip, int_ip ,machine
  ];
   
  for (var i =0 ; i<=last_row;i++){
    if(vm_data[i]==name&&d_name==""){
      Logger.log("same");
      exist=1;
      active_sheet[tag].getRange(i+1,ext_data_column).setValue(ext_ip);
      active_sheet[tag].getRange(i+1,int_data_column).setValue(int_ip);
      active_sheet[tag].getRange(i+1,mach_data_column).setValue(machine);
    }  
  }
  if(exist==0 ){
  active_sheet[tag].appendRow(values);
  }
   

  return ContentService.createTextOutput("OK");
 
}


