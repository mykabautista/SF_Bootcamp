@isTest
public class AccountTiggerHandler_Test {
   //==========================================================================//
   @isTest static void createAccount(){
                Account acc 				= TestDataFactory.createNewAcc('Account Name Test','US','West US','US','+63','+63'); //String accName, String region, String zone, String country, String phone, String fax
              
                Test.startTest();
                insert acc;
                Test.stopTest();
               
                Account acc1 = [SELECT BillingStreet FROM Account];
                system.assertEquals('Street', acc1.BillingStreet, 'Error');   
    }
    //========================================================================//
   	 @isTest static void checkPH(){
                Account acc 				= TestDataFactory.createNewAcc('Account Name Test','US','West US','PH','+63','+63');
                /*acc.Name 					= 'A';
                acc.Region__c 				= 'APAC';	
                acc.Zone__c 				= 'Southeast Asia';
                acc.Rating 					= 'Hot';
                acc.BillingCity 			= 'Mandaluyong';
                acc.BillingState 			= 'Metro Manila';
                acc.BillingCountry 			= 'PH';
                acc.BillingStreet 			= 'Street';
                acc.Phone					= '+63';
                acc.Fax						= '+63'; */
               
                Test.startTest();
                insert acc;
                Test.stopTest();
               
                Account acc2 = [SELECT BillingCountry FROM Account];
                system.assertEquals('PH', acc2.BillingCountry, 'Error');   
    } 
    //===================================================================//
    @isTest static void addressMatch(){
        		Account acnt 				= TestDataFactory.createNewAcc('Account Name Test','US','West US','US','+63','+63');

                Test.startTest();
                insert acnt;
                Test.stopTest();
      
                system.assertEquals('Account Name Test', acnt.Name, 'Error');  
       			system.debug(acnt.Name);

        		Contact con 				= TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',false);
        		/*Contact con 				= new Contact();
        		con.AccountId				= acnt.Id;
        		con.FirstName				= 'Myka Ella';
        		con.LastName				= 'Bautista'; */
        
        		insert con;
        
        		
        		acnt.BillingStreet			= 'Streets';
                acnt.BillingCity			= 'Cities';
                acnt.BillingState			= 'States';
                acnt.BillingPostalCode		= 'Postals';
        
        
        		update acnt;
    
        		Contact con1 = [SELECT MailingStreet FROM Contact WHERE AccountId = :acnt.Id];
        		system.assertEquals(acnt.BillingStreet, con1.MailingStreet, 'Error what the ef');
       
    }


}