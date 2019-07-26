global class UltimateParentAcct implements Database.Batchable<sObject>{
     global Database.QueryLocator start(Database.BatchableContext bc){ //
                            return Database.getQueryLocator([SELECT ID, AccountId 
                                                             FROM Contact]);
    }
    global void execute(Database.BatchableContext bc, List<Contact> scope){ //scope: lahat ng contacts sa org
                            for(Contact currentContact : scope){
                                
                            String checkedContactAccountId = currentContact.AccountId;
                            Boolean topLevelParent = false;
                                
                            while (!topLevelParent){
                                Account relatedAccount = [ Select Id, ParentId From Account where Id = :checkedContactAccountId limit 1];
                                if (relatedAccount.ParentID != null ) {
                                    checkedContactAccountId = relatedAccount.ParentID;
                                }
                                else {
                                    topLevelParent = true;
                                }
                            }
                                List<Account> ultimateParentAccount = [SELECT Name FROM Account WHERE Id = :checkedContactAccountId limit 1];
                                currentContact.Ultimate_Ultimate_Parent_Account__c = ultimateParentAccount.get(0).Id;
                            }
                            
                            update scope;
    }
    global void finish(Database.BatchableContext bc){
                            System.debug('zxzcz');
    }
}