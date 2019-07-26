trigger MultiPicklistTask on Account (before insert, before update) {

    for(Account myAcc : Trigger.new){
        
        if(myAcc.Fun__c != null){
                List<String> funChoices = myAcc.Fun__c.split(';');
                myAcc.FunCounter__c = funChoices.size();
            for(String taskLoop:funChoices){
                Task task = new Task();
                task.Subject = taskLoop;
                task.WhatId = myAcc.Id;
   				insert task;
            }  	
        }else{
               myAcc.FunCounter__c = 0;
        }
    }
}