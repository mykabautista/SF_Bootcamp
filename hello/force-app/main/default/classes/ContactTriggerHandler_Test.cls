@isTest
public class ContactTriggerHandler_Test {
  @isTest static void scenarioOne(){
      			Account acnt = TestDataFactory.createNewAcc('Account Name Test','US','West US','PH','+63','+63');
      			insert acnt;
      
      			List<Contact> conList = new List<Contact>();
  				conList.add(TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',false));
      			conlist.add(TestDataFactory.createNewCon(acnt.Id,'Mikee','Caronan',false));
             // Contact con = TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',false); //ID accountID, String fName, String lName, Boolean pContact
            //	Contact con2 = TestDataFactory.createNewCon(acnt.Id,'Mikee','Caronan',false);
      
               
                insert conList;

               

    }
      @isTest static void scenarioTwo(){
      			Account acnt = TestDataFactory.createNewAcc('Account Name Test','US','West US','PH','+63','+63');
          		insert acnt; 
          
               	List<Contact> conList = new List<Contact>();
  				conList.add(TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',false));
      			conlist.add(TestDataFactory.createNewCon(acnt.Id,'Mikee','Caronan',true));
          		insert conList;
          
          		conList.get(0).Primary_Contact__c = true;

                      test.startTest();
                          try{
                                update conList;
                          }
                          catch(Exception e){
                              System.assert(e.getMessage().contains(label.Primary_Contact_Error));
                          }
                      test.stopTest(); 
      }
     @isTest static void scenarioThree(){
      			Account acnt = TestDataFactory.createNewAcc('Account Name Test','US','West US','PH','+63','+63');
          		insert acnt; 
          
              	List<Contact> conList = new List<Contact>();
         		Contact con1 = TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',false);
         		Contact con2 = TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',true);
         		Contact con3 = TestDataFactory.createNewCon(acnt.Id,'Myka Ella','Bautista',true);
  				 		
         			conList.add(con1);
         			conList.add(con2);
         
         
         			insert conList;
         
                      test.startTest();
                          try{	
                              insert con3;
                          }
                          catch(Exception e){
                             System.assert(e.getMessage().contains(label.Primary_Contact_Error));
                          }
                      test.stopTest(); 
               
         
              
    } 
}