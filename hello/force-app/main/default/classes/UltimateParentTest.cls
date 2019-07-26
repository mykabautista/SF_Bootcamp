@isTest
public class UltimateParentTest {
    @isTest static void methodOne(){
        	Account acc = TestDataFactory2.createNewAcc('Parent Account','US','West US');
      			insert acc;
        
        	Account child = TestDataFactory2.createNewAcc('Child Account','US','West US');
        	child.ParentId = acc.id;
        		insert child;
                  /*  Account acc = new account(name = 'Parent Account');
                    insert acc;
                    Account child = new account(name = 'Child Account', ParentId = acc.Id);
                    insert child;*/
                       
        	List<Contact> conList = new List<Contact>();
        	Contact con = TestDataFactory2.createNewCon(child.id, 'Myka','con1');
                     //   Contact con1 = new Contact(LastName = 'con1', accountid = child.id);
                        conList.add(con);
                        insert conList;
        
        test.startTest();
        Database.executeBatch(new UltimateParentAcct(),150);
        test.stopTest();
        Contact relatedContact = [SELECT Ultimate_Ultimate_Parent_Account__c FROM Contact WHERE LastName = 'con1' LIMIT 1];
        System.assertEquals(acc.Id, relatedContact.Ultimate_Ultimate_Parent_Account__c);
    }
}