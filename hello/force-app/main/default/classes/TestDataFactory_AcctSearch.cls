@isTest
public class TestDataFactory_AcctSearch {
    
     public static Account searchAccount(String accName, String accCountry, String accType){
        Account acnt = new Account(
        Name = accName,
        BillingCountry = accCountry,
        Type = accType
        );
        
        return acnt;
    }
    public static Contact searchContact(String fName, String lName, String accId){
        Contact con = new Contact(
        FirstName = fName,
        LastName = lName,
        AccountId = accId
        );
      
        return con;
    }
    
    public static AcctSearch searchAcc(String Name, String Country, String conName, String Type){
        AcctSearch sAcc = new AcctSearch();
        sAcc.accountSearchAccountName = Name;
        sAcc.accountSearchCountry = Country;
        sAcc.accountSearchContactName = conName;
        sAcc.accountSearchType = Type;
        
        return sAcc;
    }
    

}