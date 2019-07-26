trigger createTask on Account (after insert) {

    /*for(Account myAcc : Trigger.new){
        
        if(myAcc.Fun__c != null){
            
        	List<String> funChoices = myAcc.Fun__c.split(';');
            //myAcc.FunCounter__c = funChoices.size();
            
            for(String choice : funChoices){
                
                Task newTask 		= new Task();
                newTask.Subject 	= choice;
                newTask.WhatId		= myAcc.Id;
                insert newTask;
            }
            	
        }else{
                	myAcc.FunCounter__c = 0;
        }
    }*/
}