@isTest
public class countMultiPicklistValueTest {

    @isTest public static void createMultiPicklistValue(){
        
        Account myAcc = new Account();
        myAcc.Name = 'ForTesting';
        myAcc.Fun__c = 'dadada;adadad';
        insert myAcc;
        
        myAcc.Fun__c = null;
        update myAcc;
                
        System.debug('Account ' + myAcc.Id + 'has been created.');
    }
}