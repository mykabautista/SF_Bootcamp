public class ezzel {
    
    //SEARCH CRITERIA VAR
    public static String accNameSearch { get; set; }
    public static String accCountrySearch { get; set; }
    public static String conNameSearch { get; set; }
    public static String accTypeSearch { get; set; }
    //ACCOUNT AND CONTACT WRAPPER
    public List<StringWrapper> allResultList { get; set; }    
    public static List<StringWrapper> allResults = new List<StringWrapper>();
    //PAGINATION
    public CustomPagination customPaging{ get; set; }
    public Integer totalResults{ get; set; }
    public Integer offsetSize{ get; set; }
    public Integer limitSize{ get; set; }
    
    public static Boolean hasResults { get; set; }   
    public List<Account> resultList { get; set; }
    public static List<Contact> allConList = new List<Contact>();
    public List<SelectOption> types { set; }
    
    public static String searchString = 'SELECT ID, Name, BillingCountry, ShippingCountry, Type, CreatedDate, (SELECT ID, Name, FirstName, LastName FROM Contacts) FROM Account WHERE ID != null ';
    
    //---------->>>Account Type Picklist<<<----------
    public List<SelectOption> getTypes(){        
        List<SelectOption> accTypes = new List<SelectOption>();
        accTypes.add(new SelectOption('','<None>'));
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
        List<Schema.PicklistEntry> plEntry = fieldResult.getPicklistValues();
        
        for(Schema.PicklistEntry ple : plEntry){
            accTypes.add(new SelectOption(ple.getLabel(), ple.getValue()));
        }                
        return accTypes;
    }
    
    //---------->>>Account Search<<<----------
    public void findAccounts(){        
        system.debug('Account Name: ' + accNameSearch);
        system.debug('Account Country: ' + accCountrySearch);
        system.debug('Contact Name: ' + conNameSearch);
        system.debug('Account Type: ' + accTypeSearch);
        allConList = [SELECT ID, Name, FirstName, LastName, AccountID FROM Contact WHERE Account.Id != null];
        hasResults = true;
        List<Contact> conList = new List<Contact>();
        
        //----->>>NAME SEARCH<<<-----
        if(accNameSearch != ''){
            if(accNameSearch.length() >= 2){
                if(accNameSearch.contains('*')){
                    String accNameHolder = accNameSearch;
                    accNameHolder = accNameHolder.remove('*');
                    if(accNameHolder != ''){
                        searchString = searchString + 'AND Name LIKE \'%' + accNameHolder + '%\' ';
                    }else{
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'A minimum of 2 valid characters is required to search using the Account Name.'));
                		hasResults = false;
                    }
                    
                }else{
                    searchString = searchString + 'AND Name = :accNameSearch ';
                }
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'A minimum of 2 characters is required to search using the Account Name.'));
                hasResults = false;
            }
        }
        
        //----->>>COUNTRY SEARCH<<<-----***
        if(accCountrySearch != ''){
            if(accCountrySearch.contains('*')){
                accCountrySearch = accCountrySearch.remove('*');
            }
            searchString = searchString + 'AND BillingCountry = :accCountrySearch ';
        }
        
        //----->>>CONTACT SEARCH<<<-----
        if(conNameSearch != ''){
            if(conNameSearch.contains('*')){
                conNameSearch = conNameSearch.remove('*');
            }
            String conNameHolder = '\'%' + conNameSearch + '%\'';
            //system.debug('conNameHolder: ' + conNameHolder);
            String conSearchString = 'AND ID IN(SELECT AccountID FROM Contact WHERE NAME LIKE '+ conNameHolder +' ) ';
            searchString = searchString + conSearchString;
        }
        
        //----->>>ACCOUNT TYPE SEARCH<<<-----
        if(accTypeSearch != '' && accTypeSearch != null){
            searchString = searchString + 'AND Type = :accTypeSearch ';
        }
        
                
        //======================================================================================================================//
        searchString = searchString + 'ORDER BY Name ASC ';
        //system.debug(searchString + 'kek');     
        resultList = Database.query(searchString);
        //system.debug('check >>> ' + resultList.size());
        //======================================================================================================================//
        
        //RESULT LIST
        //=========WRAPPER==========//
        for(Account myAcc : resultList){
            Integer conNum = 0;
            for(Contact myCon : allConList){                
                if(myCon.AccountId == myAcc.id){
                    //system.debug('checkek');
                    if(conNameSearch != '' || conNameSearch != null){
                        if(myCon.Name.containsIgnoreCase(conNameSearch)){
                            conNum++;
                            allResults.add(new StringWrapper(myAcc, myCon));
                            //system.debug(myAcc.Name + ' ' + myCon.Name + 'checker');
                        }
                    }else if(conNameSearch == ''){
                        conNum++;
                        allResults.add(new StringWrapper(myAcc, myCon));
                        //system.debug(myAcc.Name + ' ' + myCon.Name);
                    }
                }
            }    
            if(conNum == 0){
                allResults.add(new StringWrapper(myAcc));
                //system.debug(myAcc.Name + ' has no contact');
            }
        }
        //>=========WRAPPER==========<//
        
        if(allResults.size() == 0){
            hasResults = false;
        }else if((accNameSearch == null || accNameSearch == '') && (accCountrySearch == null || accCountrySearch == '') && (conNameSearch == null || conNameSearch == '') && (accTypeSearch == null || accTypeSearch == '')){
            hasResults = false;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please provide a value for at least 1 of the available criteria.'));            
        }else{
            allResultList = allResults;
        }
        system.debug('check >>>>> ' + allResults.size());
        //======================================================================================================================//
        
        system.debug('checkcheck ' + allResultList[0].con.name);
        customPaging = new CustomPagination(allResultList);
        
    }
    
    //======================================================================================================//
    //---------->>>PAGING BUTTON<<<----------
    /*public void goNext(){
        customPaging.gotoNext();
    }
    
    public void goPrevious(){
        customPaging.gotoPrevious();
    }*/
	
    
    
    
    
}