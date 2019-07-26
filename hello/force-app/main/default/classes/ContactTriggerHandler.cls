public class ContactTriggerHandler {

    public static void onlyOnePrimaryContact(List<Contact> contactList, Map<Id, Contact> oldMap)
   
    {
        //Identify id there is a True in the insert
        Boolean goIn = False;   
        List<Integer> bList = new List<Integer>(); 
        for(integer x = 0; x < contactList.Size(); x++)
        {
            if(contactList.get(x).Primary_Contact__c == True)
            {
             goIn = True;
                bList.add(x);
            }
        }
        for(Contact con : contactList)
        {
      				List<Contact> listContact = [SELECT id,
                                       Primary_Contact__c
                                       FROM Contact
                                      WHERE AccountId = :con.AccountID
                                     AND Primary_Contact__c = True
                                      LIMIT 1];


                        Integer i = listContact.Size();
                        System.debug('goIn ' + goIn);
                        System.debug('bList ' + bList );
                        System.debug(i);
                        System.debug(goIn);
           
            
        if(trigger.isUpdate){
        Contact oldMapId    = oldMap.get(con.Id);
        Boolean newContactPrimary  = con.Primary_Contact__c; 
        Boolean oldContactPrimary  = oldMapId.Primary_Contact__c;
            if(oldContactPrimary != null && oldContactPrimary != null && i > 0 && goIn == True && newContactPrimary != oldContactPrimary)
            {
                
            con.Primary_Contact__c.AddError(Label.Primary_Contact_Error);
            }
  			 }
        if(trigger.isInsert){
                  if( i > 0 && goIn == True )
            {
            con.Primary_Contact__c.AddError(Label.Primary_Contact_Error);
            }
           
            }
   
            if(!(i > 0) && goIn == False)
            {
            con.Primary_Contact__c = True;
            break;
            }
            if(bList.size() > 1)
            {
            con.Primary_Contact__c.AddError(Label.Primary_Contact_Error);
            }
            System.debug('goIn Final ' + goIn);
   
        }
    } 

}


//Label.Error_Existing_Primary_for_Account