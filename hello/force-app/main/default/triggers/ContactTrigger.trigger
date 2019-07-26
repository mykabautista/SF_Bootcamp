trigger ContactTrigger on Contact (before Update, before insert) {

   // if(trigger.isUpdate)
   // {
       ContactTriggerHandler.onlyOnePrimaryContact(Trigger.new, Trigger.oldMap);
   // }
  //  if(trigger.isInsert)
  //  {
    //   ContactTriggerHandler.onlyOnePrimaryContact1(Trigger.new);
   // }
}