public class AcctSearch {
    //SEARCH
    public  String accountSearchAccountName { get; set; }
    public  String accountSearchCountry { get; set; }
    public  String accountSearchContactName { get; set; }
    public  String accountSearchType { get; set; }
    
    //ACCOUNT AND CONTACT WRAPPER
    public List<StringWrapper> allResultList { get; set; }    
    public static List<StringWrapper> allResults = new List<StringWrapper>();
    
    //PAGINATION
    public CustomPagination customPaging{ get; set; }
    public Integer totalResults{ get; set; }
    public Integer offsetSize{ get; set; }
    public Integer limitSize{ get; set; }
    
    public static boolean hasSearchResults { get; set; }
    public static List<Account> searchResults { get; set; }
    public static List<Contact> allConList = new List<Contact>();
    public List<SelectOption> types { set; }
    
    public static String dynamicQuery = 'SELECT ID, Name, CreatedDate, BillingCountry, ShippingCountry, Type, (SELECT Id, Name, FirstName, LastName FROM Contacts) FROM Account WHERE Id != null ' ; 
    
    //LOADING SCREEN
    public void loadingScreen(){
        long now = datetime.now().getTime();
        while(datetime.now().getTime() - now < 2000); 
    } //actionStatus spinner
    
    
    //ACCOUNT TYPE PICKLIST
    public List<SelectOption> getPickValues(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--None--'));
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple){
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        } 
        return options;
    }    
    
    public class AccConWrapper{
        public Account Acc{ get; set; }
        public Contact Con{ get; set; }
        
        public AccConWrapper(Account Acc, Contact Con){
            this.Acc = Acc;
            this.Con = Con;
        }
    }
    
    //BUTTON Find Accounts
    public void submitForm(){
        allConList = [SELECT ID, Name, FirstName, LastName, AccountID FROM Contact WHERE Account.Id != null];
        hasSearchResults = true;
      
   
        //========================NAME SEARCH==========================
        if(accountSearchAccountName != ''){ 
            if(accountSearchAccountName.length() >= 2){
                if(accountSearchAccountName.contains('*')){
                    String nameHolder = accountSearchAccountName;
                    nameHolder = nameHolder.remove('*');
                    if(nameHolder != ''){
                        dynamicQuery = dynamicQuery + 'AND Name LIKE \'%' + nameHolder + '%\' ';    
                    }else{
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'A minimum of 2 valid characters is required to search using the Account Name.'));
                        hasSearchResults = false;
                    }
                }else{
                    dynamicQuery = dynamicQuery + 'AND Name = :accountSearchAccountName ';
                }
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'A minimum of 2 characters is required to search using the Account Name.'));
                hasSearchResults = false;
            }
        }
        
        //========================COUNTRY SEARCH==========================
        if(accountSearchCountry != ''){
            if(accountSearchCountry.contains('*')){
                accountSearchCountry = accountSearchCountry.remove('*');
            }
            dynamicQuery = dynamicQuery + ' AND BillingCountry = :accountSearchCountry '; 
        }
        
        //========================CONTACT SEARCH==========================
        if(accountSearchContactName != ''){
            if(accountSearchContactName.contains('*')){
                accountSearchContactName = accountSearchContactName.remove('*');
            }
            String contactnameHolder = '\'%' + accountSearchContactName + '%\'';
            String conSearchString = 'AND ID IN(SELECT AccountID FROM Contact WHERE NAME LIKE '+ contactnameHolder +') ';
            dynamicQuery = dynamicQuery + conSearchString; 
        }
        
        //========================TYPE SEARCH==========================
        if(accountSearchType != '' && accountSearchType != null){
            dynamicQuery = dynamicQuery + ' AND Type = :accountSearchType';
        }
        
        searchResults = Database.query(dynamicQuery);
        if(searchResults.size() > 0){
            hasSearchResults = true;
        }
        
        dynamicQuery = dynamicQuery + ' ORDER BY Name ASC ';
        searchResults = Database.query(dynamicQuery);
        
        
        //WRAPPER
        for(Account myAcc : searchResults){
            Integer conNum = 0;
            for(Contact myCon : allConList){                
                if(myCon.AccountId == myAcc.id){
                    if(accountSearchContactName != '' || accountSearchContactName != null){
                        if(myCon.Name.containsIgnoreCase(accountSearchContactName)){
                            conNum++;
                            allResults.add(new StringWrapper(myAcc, myCon));
                        }
                    }else if(accountSearchContactName == ''){
                        conNum++;
                        allResults.add(new StringWrapper(myAcc, myCon));
                    }
                }
            }    
            if(conNum == 0){
                allResults.add(new StringWrapper(myAcc));            }
        }
        
        if(allResults.size() == 0){
            hasSearchResults = false;
        }else if((accountSearchAccountName == null || accountSearchAccountName == '') && (accountSearchCountry == null || accountSearchCountry == '') && (accountSearchContactName == null || accountSearchContactName == '') && (accountSearchType == null || accountSearchType == '')){
            hasSearchResults = false;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please provide a value for at least 1 of the available criteria.'));            
        }else{
            allResultList = allResults;

            customPaging = new CustomPagination(allResultList);
        }
        //======================================================================================================================//
        
    }
}