public class MassDeleteAccountCtrl {
    
    public class AccountWrapper {
        public Account acct {get;set;}
        public boolean isCheck {get;set;}
        
        
        public AccountWrapper(Account acct, boolean isCheck) {
            this.acct = acct;
            this.isCheck = isCheck;
        }
    }
    
    public boolean selectAll {get;set;}
    public List<Account> acctList {get;set;}
    public List<AccountWrapper> acctWrapList {get;set;}

    public MassDeleteAccountCtrl() {
        getAccts();
    }
    
    public void getAccts() {
        acctList = [SELECT Id, Name, Type, Industry FROM Account];
        acctWrapList = new List<AccountWrapper>();
        for(Account acc : acctList) {
            acctWrapList.add(new AccountWrapper(acc, false));
        }
    }
    
    public void deleteAccounts() {
        List<Account> forDelAccts = new List<Account>();
        for(AccountWrapper aw : acctWrapList) {
            if(aw.isCheck) {
                forDelAccts.add(aw.acct);
            }
        }
        try{
        delete forDelAccts;
        }
        catch(Exception e){
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
         ApexPages.addMessage(myMsg);
        }
        getAccts();
       
    }
    
    public void selectAllAccounts() {
        for(AccountWrapper aw : acctWrapList) {
            aw.isCheck = selectAll;
        }
    }
}