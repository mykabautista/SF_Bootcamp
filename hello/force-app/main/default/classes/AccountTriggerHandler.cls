public class AccountTriggerHandler{
    //When a user updates an existing  Account's Billing Address, the new address should be copied over to the Mailing Address of each of the Contacts related to the Account.
     public static void accountContactRelationship(List<Account> accList){
    for(Account acc : accList){
        List<Contact> contacts = [SELECT ID
                                 FROM CONTACT
                                 WHERE ACCOUNTID = :acc.id];
        
        for(Contact myCon : contacts){
           myCon.MailingStreet  = acc.BillingStreet;
           myCon.MailingCity    = acc.BillingCity;
           myCon.MailingState   = acc.BillingState;
           myCon.MailingCountry = acc.BillingCountry;
           myCon.MailingPostalCode = acc.BillingPostalCode;
            
             		// On the Contact, there should be a checkbox labeled as "Primary Contact". 
             		// If checked, it designates the Contact as a Primary Contact.
             		// An Account can have mutiple Non-Primary Contacts.
                 
        }
        
        update contacts;
     

    }
}
}
  /*  public static void onBeforeInsert(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
        //Call your helper class
    }

    public static void onAfterInsert(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
        //Call your helper class
    }

    public static void onBeforeUpdate(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
        //AccountBL.checkAccount(oldAccountMap, newAccountList);
    }

    public static void onAfterUpdate(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
        //Call your helper class
    }

    public static void onBeforeDelete(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
        //Call your helper class
    }

    public static void onAfterDelete(List<Account> newAccountList, Map<Id,Account> newAccountMap, List<Account> oldAccountList, Map<Id,Account> oldAccountMap){
       //Call your helper class */