public class TestDataFactory2 {
    
    public static Account createNewAcc(String accName, String region, String zone){
         		Account acc = new Account();
				acc.Name 					= accName;
                acc.Region__c 				= region;	
                acc.Zone__c 				= zone; 
        		
          
          return acc;
}
	public static Contact createNewCon(ID accountID, String fName, String lName){
         		Contact con = new Contact();
				con.AccountId 				= accountID;
                con.FirstName				= fName;	
                con.LastName 				= lName;
        		//con.Primary_Contact__c 		= pContact;
        		//con.AccountId				= acctName;

          return con;
}
    
    
    
    
    
}




/*
 * @isTest
public class TestDataFactory {
      public static Account createNewAcc(String accName, String region, String zone, String country, String phone, String fax){
         		Account acc = new Account();
				acc.Name 					= accName;
                acc.Region__c 				= region;	
                acc.Zone__c 				= zone;
                acc.Rating 					= 'Hot';
                acc.BillingCity 			= 'City';
                acc.BillingState 			= 'State';
                acc.BillingCountry 			= country;
                acc.BillingStreet 			= 'Street';
         		acc.Phone					= phone;
                acc.Fax						= fax;
          
          return acc;
}
    public static Contact createNewCon(ID accountID, String fName, String lName, Boolean pContact){
         		Contact con = new Contact();
				con.AccountId 				= accountID;
                con.FirstName				= fName;	
                con.LastName 				= lName;
        		con.Primary_Contact__c 		= pContact;

          return con;
}

    
}*/