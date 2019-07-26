trigger MyAssignments_Trigger on My_Assignments__c (after insert,before Update) {
    
   if(Trigger.isBefore && Trigger.isUpdate) {
       

	}  else if(Trigger.isAfter && Trigger.isInsert) {

	}
    

}