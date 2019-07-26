public class contactClass {

    public static void onlyOnePrimaryContact(List<Contact> newContactList)
    {
       Boolean cPrime = False;
        for(Integer c=0; c<newContactList.size(); c++) {
            if(newContactList.get(c).Primary_Contact__c == True) {
              
 				if(cPrime == False) {
                    cPrime = True;
                } else {
                    newContactList.get(c).Primary_Contact__c.addError('Invalid Primary Contact. This Account' 
                                                      + ' has an existing Primary Contact.');
                } 
 

                
            }
        }
        for(Contact cont : newContactList) {
            List<Contact> con = [SELECT Id
                                   FROM Contact
                                  WHERE AccountId = :cont.AccountId
                                    AND Primary_Contact__c = True];
            if(cont.Primary_Contact__c == True){
                if(con.isEmpty()) {
                } else {
                    cont.Primary_Contact__c.addError(Label.Primary_Contact_Error);
                }
            } else {
        
                if(con.isEmpty() && cPrime == False){
                    cont.Primary_Contact__c = True;
                    System.debug('Changed');
                    cPrime = True;
                }
            
            }
            System.debug(cont.Primary_Contact__c);
        
    
 		
            if(cont.Primary_Contact__c == True) {
                if(con.isEmpty()) {
                } else {
                    cont.Primary_Contact__c.addError(Label.Primary_Contact_Error);
                }
            }
        }
    }
}