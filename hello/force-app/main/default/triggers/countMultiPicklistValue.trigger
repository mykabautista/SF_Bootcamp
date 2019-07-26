trigger countMultiPicklistValue on Account (before insert, before update) {
	
    for(Account myAcc : Trigger.new){
        
        if(myAcc.Fun__c != null){
                List<String> funChoices = myAcc.Fun__c.split(';');
                myAcc.FunCounter__c = funChoices.size();
        }else{
               myAcc.FunCounter__c = 0;
        }
    }
}