public class SearchClass {
	@AuraEnabled
    public static List<Account> accountSearch(String accName){
        return[SELECT Id, Name, Phone, Type FROM Account WHERE name =: accName];
    }
}